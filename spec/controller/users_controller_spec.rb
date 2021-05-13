require 'rails_helper'
include ApplicationHelper

RSpec.describe UsersController, type: :controller do
  # describe "GET index" do
  #   it "assign @users" do
  #     user = User.create!(name: "Name User ",
  #           email: "test@mail.com",
  #           admin: true)
  #     get :index
  #     expect(assigns(:users)).to eq([user])
  #   end

  #   it "render the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end
  # end

  describe "POST #update" do
    context "success when valid attributes" do
      before do
        @user = User.create!(name: "Name User ",
            email: "test@mail.com",
            admin: true)
        log_in @user

        put :update, params: {
            user: {name: "Change Name"},
            id: @user.id
          }
        @user.reload
      end

      it "update db success" do
        expect([@user.name]).to eq(["Change Name"])
      end

      it "redirects to the user_path" do
        expect(response).to redirect_to @user
      end
    end

    context "fail when user login not yet" do
      before do
        @user = User.create!(name: "Name User ",
            email: "test@mail.com",
            admin: true)

        put :update, params: {
            user: {name: "Change Name"},
            id: @user.id
          }
      end

      it "show flash danger" do
        expect(flash[:danger]).to eq I18n.t("users.please_log_in")
      end
      it "redirect to login_path" do
        expect(response).to redirect_to login_url
      end
    end

    context "fail when params id not found" do
      before do
        @user = User.create!(name: "Name User ",
            email: "test@mail.com",
            admin: true)
        log_in @user

        put :update, params: {
            user: {name: "Change Name"},
            id: -1
          }
      end

      it "display flash warning " do
        expect(flash[:danger]).to eq "User not found"
      end

      it "redirect show user page" do
        expect(response).to redirect_to redirect_to root_path
      end
    end

    context "fail when not correct current user" do
      before do
        User.create!(name: "Name User 1",
            email: "test1@mail.com",
            admin: false)

        @user = User.create!(name: "Name User ",
            email: "test@mail.com",
            admin: true)
        log_in @user

        put :update, params: {
            user: {name: "Change Name"},
            id: User.first.id
          }
      end
      it "redirect to root_path" do
        expect(response).to redirect_to root_path
      end
    end

    context "fail when invalid attributes" do
      before do
        @user = User.create!(name: "Name User ",
            email: "test@mail.com",
            admin: true)
        log_in @user

        put :update, params: {
            user: {name: ""},
            id: @user.id
          }
        @user.reload
      end

      it "render edit" do
        expect(response).to render_template :edit
      end
    end
  end
end
