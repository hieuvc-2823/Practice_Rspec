
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
