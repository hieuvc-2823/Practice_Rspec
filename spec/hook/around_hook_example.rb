class Database
  def self.transaction
    puts "open transaction"
    yield
    puts "close transaction"
  end
end

describe "around filter" do
  around(:each) do |example|
    Database.transaction(&example)
  end

  it "gets run in order" do
    puts "run the example"
  end
end



