require './lib/account.rb'
require 'date'
include Math


describe Account do
before do
@subject = Account.new('holger', 1000)
end

  it 'checks length of pin code' do
    number = @subject.pin_code
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end
end
