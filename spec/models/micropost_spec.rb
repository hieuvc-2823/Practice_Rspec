require 'rails_helper'

RSpec.describe Micropost, type: :model do
  describe "#order_by_created_at" do
    it "orders by created_at desc" do
      user = User.create!(name: "Name User ",
            email: "test@mail.com",
            admin: true)
      post_1 = user.microposts.create content: "The first post"
      post_2 = user.microposts.create content: "The second post"
      expect(Micropost.order_by_created_at).to eq([post_2, post_1])
    end
  end
end
