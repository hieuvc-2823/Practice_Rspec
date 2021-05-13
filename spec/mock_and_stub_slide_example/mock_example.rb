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
  let(:loginService) {LoginService.new(username, 'password', authService)}

  context "when correct username and password" do
    let(:username) {'username'}

    it "login successfully" do
      expect(authService).to receive(:authenticate).with(username,'password').and_return(true)
      loginService.perform
    end
  end
end
