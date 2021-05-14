RSpec.shared_examples "collections" do |collection_class|
  it "is empty when first created" do
    expect(collection_class.new).to be_empty
  end
end

RSpec.describe Array do
  include_examples "collections", Array
end

RSpec.describe Hash do
  include_examples "collections", Hash
end

RSpec.describe String do
  include_examples "collections", String
end
