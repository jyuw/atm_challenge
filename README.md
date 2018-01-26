# Week 1: ATM Challenge - Craft Academy 

This program is a simple implementation of a virtual ATM
## Introduction
As a practice program, we were concentrating primarily on learning Ruby and RSpec, and also used TravisCi and Coveralls for testing the end result. 

The atm assumes the following parameters:
  - An ATM machine can hold up to $1000
  - Withdrawal can be cleared only if
    - The ATM holds enough funds
    - The amount is divisible by 5
    - The person attempting the withdrawal provides a valid ATM card
        - with a valid pin and expire date
        - with a card status that is active (Not report stolen or lost)
    - The person attempting the withdrawal has sufficient funds on his account
* There are only $5, $10 and $20 bills in the ATM. Withdrawals for amounts not divisible by 5 must be rejected.

## Usage
After cloning the repo, run by loading the person.rb file into IRB. This will load all required files as well.

``` load ‘lib/person.rn’ ```

Give birth to a lovely new person

`holger = Person.new(name: ‘Holger’)`

And create a bank account for them so they can start contributing to society already

`holger.create_account `

Make sure they work for their money

`holger.go_to_work(1000)`

To be deposited into the ATM

`holger.deposit(1000)`

Next, create an ATM

`atm = Atm.new `

Pin and card expiry and be returned using:
```
holger.account.pin_code

holger.account.exp_date
```
Next, deposit your hard-earned cash into the system

 `holger.deposit(100)`
 
It can then be withdrawn by passing in the amount to be withdrawn, the pin code, and your name.account

`atm.withdraw(50, 1279, holger.account)` 

When the withdraw command is run, a message will print out letting the user know whether or not the transaction was completed successfully. If not, an error message will allow the user to know where the problem occurred. 
