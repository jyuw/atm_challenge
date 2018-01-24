# Person class
require 'account.rb'
require 'atm.rb'

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

  def deposit(attrs = {})
    @account.nil? ? no_account : deposit_funds(attrs)
  end

  def withdraw(attrs = {})
    attrs[:atm].withdraw(attrs[:amount], attrs[:pin], attrs[:account])
  end

private

  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def missing_name()
    raise 'A name is required'
  end

  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
  end

  def no_account
    raise 'No account present'
  end

end
