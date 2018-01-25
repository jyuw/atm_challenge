require './lib/account.rb'
require 'date'

describe Account do
  let(:person) { instance_double('Person', name: 'Jade') }
  subject { described_class.new(owner: person) }

  it 'expected to have a owner' do
    expect(subject.owner).to eq person
  end

  it 'checks length of pin code' do
    number = subject.pin_code
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date =
      Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'is expected to :deactivate using a instance method' do
    # we chose to use an instance method over a class method because the state
    # of the the activation is only valid once an instance of the the class has
    # been created
    subject.deactivate
    expect(subject.account_status).to eq :inactive
  end

  it 'is expected to raise error if owner is missing' do
    expect { described_class.new }.to raise_error('An owner is required')
  end

end
