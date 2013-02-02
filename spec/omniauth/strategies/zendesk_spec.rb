require 'spec_helper'

describe OmniAuth::Strategies::Zendesk do
  attr_accessor :app
  
  let(:auth_hash){ last_response.headers['env']['omniauth.auth'] }
  
  # customize rack app for testing, if block is given, reverts to default
  # rack app after testing is done
  def set_app!(options = {})
    old_app = self.app
    self.app = Rack::Builder.app do
      use Rack::Session::Cookie, secret: 'ultra_strong_secret'
      use OmniAuth::Strategies::Zendesk, options
      run lambda{|env| [404, {'env' => env}, ["HELLO!"]]}
    end
    if block_given?
      yield
      self.app = old_app
    end
    self.app
  end
  
  before(:all) do
    set_app!
  end
  
  describe '#request_phase' do
    it 'should display a form' do
      get '/auth/zendesk'
      last_response.body.should be_include("<form")
    end
  end
  
  describe '#callback_phase' do
    context 'with valid credentials' do
      before do
        stub_request(:get, "https://john%40example.com:awesome@my.zendesk.com/api/v2/users/me").
          to_return(status: 200, body: File.new(File.dirname(__FILE__) + '/../../fixtures/me.json'), headers: {content_type: "application/json; charset=utf-8"})
        post '/auth/zendesk/callback', email: 'john@example.com', password: 'awesome', site: 'my'
      end

      it 'should populate the auth hash' do
        auth_hash.should be_kind_of(Hash)
      end

      it 'should populate the uid' do
        auth_hash['uid'].should == 'https://my.zendesk.com/api/v2/users/35436.json'
      end

      it 'should populate the info hash' do
        auth_hash['info']['name'].should == 'Johnny Agent'
      end
    end

    context 'with invalid credentials' do
      before do
        OmniAuth.config.on_failure = lambda{|env| [401, {}, [env['omniauth.error.type'].inspect]]}
        stub_request(:get, "https://wrong%40example.com:login@my.zendesk.com/api/v2/users/me").
          to_return(status: 200, body: File.new(File.dirname(__FILE__) + '/../../fixtures/anonymous.json'), headers: {content_type: "application/json; charset=utf-8"})
        post '/auth/zendesk/callback', email: 'wrong@example.com', password: 'login', site: 'my'
      end
    
      it 'should fail with :invalid_credentials' do
        last_response.body.should == ':invalid_credentials'
      end
    end
  end
end