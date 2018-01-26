require './lib/account.rb'
require './lib/atm.rb'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil
  end

  def create_account()
    @account = Account.new(owner: self)
  end

  def go_to_work(amount)
    @cash += amount
  end

  def deposit(attrs = {})
    @account.nil? ? no_account : deposit_funds(attrs)
  end

  def withdraw(attrs = {})
    attrs[:atm].nil? ? no_atm : withdraw_funds(attrs)
  end

  private

  def set_name(obj)
    obj.nil? ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end

  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
  end

  def no_account
    raise 'No account present'
  end

  def no_atm
    raise 'An ATM is required'
  end

  def withdraw_funds(attrs = {})
    @cash += attrs[:amount]
    attrs[:atm].withdraw(attrs[:amount], attrs[:pin], attrs[:account])
  end
end
