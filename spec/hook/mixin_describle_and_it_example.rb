describe "Test before all and each" do
 before :each do
   puts "before it"
 end

 before :all do
  puts "before describe"
 end

 describe "describe 1" do
   before do
     puts "before"
   end

   it "test case 1.1" do
   end

   it "test case 1.2" do
   end
 end

 describe "describe 2" do
   it "test case 2.1" do
   end

   it "test case 2.2" do
   end
 end
end
