class DataProcessor
  Error = Class.new(StandardError)

  def process(data, validator)
    raise Error unless validator.valid?(data)

    # simple logic to show the idea
    "#{data} processed"
  end
end

# describe DataProcessor do
#   let(:processor) { described_class.new }

#   context 'with valid data' do
#     it 'adds processed to data' do
#       validator = double(:validator, valid?: true)
#       # allow(validator).to receive(:valid?).and_return(true)
#       expect(processor.process('foo', validator)).to eq('foo processed')
#     end
#   end

#   context 'with invalid data' do
#     it 'raises Error' do
#       validator = double(:validator, valid?: false)
#       # allow(validator).to receive(:valid?).and_return(false)
#       expect { processor.process('foo', validator) }.to raise_error(DataProcessor::Error)
#     end
#   end
# end


describe DataProcessor do
  let(:processor) { described_class.new }

  context 'with valid data' do
    it 'adds processed to data' do
      validator = double(:validator, valid?: true)
      expect(processor.process('foo', validator)).to eq('foo processed')
    end
  end

  context 'with invalid data' do
    it 'raises Error' do
      validator = double(:validator, valid?: false)
      expect { processor.process('foo', validator) }.to raise_error(DataProcessor::Error)
    end
  end

  it "calls validator.valid?" do
    validator = double(:validator)
    expect(validator).to receive(:valid?).with('foo').and_return(true)
    expect(processor.process('foo', validator)).to eq('foo processed')
  end
end
