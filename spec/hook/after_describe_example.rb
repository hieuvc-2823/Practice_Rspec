describe "an error in after(:all)" do
 after(:all) do
   puts "after describe or context"
 end
 context "a context" do
   it "passes this example" do
     #...
   end
 end
  context "a context1" do
   it "passes this example, too" do
     #...
   end
 end
end
