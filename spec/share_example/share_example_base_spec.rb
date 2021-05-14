require "set"

# Before use Share examples
# RSpec.describe Array do
#   let(:something1) { "parameter1" }
#   let(:something2) { "parameter2" }

#   it "uses the given parameter" do
#     expect(something1).to eq("parameter1")
#   end

#   it "uses the given parameter" do
#     expect(something2).to eq("parameter2")
#   end
# end

# Sử dụng Share examples
RSpec.shared_examples "some example" do |parameter|
  let(:something) { parameter }
  it "uses the given parameter" do
    expect(something).to eq(parameter)
  end
end

RSpec.describe Array do
  it_behaves_like "some example", "parameter1"
  it_behaves_like "some example", "parameter2"
end

RSpec.describe Set do
  it_behaves_like "some example", "parameter1"
  it_behaves_like "some example", "parameter2"
end

RSpec.describe Hash do
  it_behaves_like "some example", "parameter1"
  it_behaves_like "some example", "parameter2"
end
