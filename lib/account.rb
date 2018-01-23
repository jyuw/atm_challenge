require 'date'
# Account class
class Account
  attr_accessor :pin_code, :balance, :account_status, :exp_date
  STANDARD_VALIDITY_YRS = 5

def initialize(owner, balance)
  @owner = owner
  @balance = balance
  @account_status = :active
  @pin_code = rand(1000..9999)
  @exp_date = set_expiry_date
end

def set_expiry_date
  Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime("%m/%y")
end

end
