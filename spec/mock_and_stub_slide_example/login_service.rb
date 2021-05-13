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
