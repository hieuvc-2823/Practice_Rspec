class LoginService
   attr_accessor :authService, :username, :password

   def initialize(username, password, authService = AuthService.new)
    @username = username
    @password = password
    @authService = authService
   end

   def perform
      authService.authenticate(username, password)
   end
end

class AuthService
   def authenticate(username, password)
      # Call to external API
   end
end

describe '#perform' do
  let(:authService) {double('fake AuthService')}

  subject {LoginService.new('username', 'password', authService).perform}

  context "when correct username and password" do
    it "login successfully" do
      allow(authService).to receive(:authenticate).and_return(true)

      is_expected.to eq true
    end
  end
end
