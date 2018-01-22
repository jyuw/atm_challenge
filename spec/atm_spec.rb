require './lib/atm.rb'

describe Atm do
  it 'has 1000 when initialized' do
    expect(subject.funds).to eq 1000
  end

  it 'reduces funds by withdrawal amount' do
    subject.withdraw 50
    expect(subject.funds).to eq 950
  end

end
