require 'rails_helper'
RSpec.describe "Users", type: :request do
  describe "GET index" do
    it "assign @users" do
      user = User.create(name: "user name", email: "email@email.com", admin: 0)
      get "/users"
      expect(assigns(:users)).to eq([user])
    end

    it "render the index template" do
      get "/users"
      expect(response).to render_template("index")
    end
  end
end
