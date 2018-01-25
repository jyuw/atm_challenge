require 'date'
require 'person.rb'
require 'atm.rb'

class Account
  attr_accessor :balance, :account_status, :owner
  attr_reader :pin_code, :exp_date
  STANDARD_VALIDITY_YRS = 5

  def initialize(attrs = {})
    @balance = 0
    @account_status = :active
    @pin_code = generate_pin
    @exp_date = set_expiry_date
    @owner = set_owner(attrs[:owner])
  end

  def set_expiry_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def generate_pin
    rand(1000..9999)
  end

  def deactivate
    # we chose to use an instance method over a class method because the state
    # of the the activation is only valid once an instance of the the class has
    # been created
    @account_status = :inactive
  end

  private

  def set_owner(obj)
    obj.nil? ? missing_owner : @owner = obj
  end

  def missing_owner
    raise 'An owner is required'
  end

end
