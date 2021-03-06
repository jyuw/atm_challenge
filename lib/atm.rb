require 'date'
require './lib/person.rb'
require './lib/account.rb'

class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account)
    case
    when incorrect_pin?(pin_code, account.pin_code)
      { status: false, message: 'wrong pin', date: Date.today.strftime('%m/%y') }
    when card_expired?(account.exp_date)
      { status: false, message: 'card expired', date: Date.today.strftime('%m/%y') }
    when account_status?(account.account_status)
      { status: false, message: 'Account disabled', date: Date.today.strftime('%m/%y')}
    when indivisible_amount?(amount)
      { status: false, message: 'amount should be divisible by 5', date: Date.today.strftime('%m/%y') }
    when insufficient_funds_in_account?(amount, account)
      { status: false, message: 'insufficient funds in account', date: Date.today.strftime('%m/%y') }
    when insufficient_funds_in_atm?(amount)
      { status: false, message: 'insufficient funds in ATM', date: Date.today.strftime('%m/%y') }
    else
      perform_transaction(amount, account)
    end
  end

  private

  def indivisible_amount?(amount)
    amount % 5 != 0
  end

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance -= amount
    { status: true,
      message: 'success',
      date: Date.today,
      amount: amount,
      bills: add_bills(amount) }
  end

  def add_bills(amount)
    denom = [20, 10, 5]
    bills = []
    denom.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
    bills
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def account_status?(status)
    status == :disable
  end
end
