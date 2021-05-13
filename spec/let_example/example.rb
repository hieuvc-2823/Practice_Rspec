# run fail
# $count = 0
# describe "let" do
#   let(:increase_count) {$count += 1}

#   it "return 1" do
#     expect($count).to eq(1)
#   end
# end

# $count = 0
# describe "let" do
#   let(:increase_count) {$count += 1}

#   it "return 1" do
#     increase_count
#     expect($count).to eq(1)
#   end
# end


# Use with let!
$count = 0
describe "let!" do
  let!(:increase_count) {$count += 1}

  it "return 1" do
    expect($count).to eq(1)
  end
end
