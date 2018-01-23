require 'date'
# Account class
class Account
attr_accessor :pin_code, :balance, :account_status, :exp_date

def initialize(owner, balance)
  @owner = owner
  @balance = balance
  @account_status = :active
  @pin_code = rand(1000..9999)
end

end
