require 'rails_helper'

# // slide No.25
# RSpec.describe "Products", type: :request do
#   describe "GET /show" do
#     it "render show when params id valid " do
#       product = Product.create name: "Book"

#       get "/products/show", params: {id: product.id}
#       expect(response).to render_template(:show)
#     end

#     it "display flash warning when product not found" do
#       get "/products/show", params: {id: -1}
#       expect(flash[:warning]).to eq "Product is not found!"
#     end

#     it "redirect root page when product not found" do
#       get "/products/show", params: {id: -1}
#       expect(response).to redirect_to root_path
#     end
#   end
# end

# // Slide No.27
# RSpec.describe "Products", type: :request do
#   describe "GET /show" do
#     it "render show when params id valid " do
#       product = Product.create name: "Book"

#       get "/products/show", params: {id: product.id}
#       expect(response).to render_template(:show)
#     end

#     context "when product not found" do
#       it "display flash warning " do
#         get "/products/show", params: {id: -1}
#         expect(flash[:warning]).to eq "Product is not found!"
#       end

#       it "redirect root page" do
#         get "/products/show", params: {id: -1}
#         expect(response).to redirect_to root_path
#       end
#     end
#   end
# end

# // Slide No.28
RSpec.describe "Products", type: :request do
  describe "GET /show" do
    context "when product id valid" do
      it "render show when params id valid " do
        product = Product.create name: "Book"

        get "/products/show", params: {id: product.id}
        expect(response).to render_template(:show)
      end
    end

    context "when product not found" do
      before {get "/products/show", params: {id: -1}}

      it "display flash warning " do
        expect(flash[:warning]).to eq "Product is not found!"
      end

      it "redirect root page" do
        expect(response).to redirect_to root_path
      end
    end
  end
end
