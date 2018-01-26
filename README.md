Week 1: ATM Challenge - Craft Academy 

Introduction
This program is a simple implementation of a virtual ATM, and can be run using IRB. 
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
* Upon a successful withdrawal the system should return a receipt with information about the date, amount and bills that was dispatched. (The receipt should be presented in the form of a Hash.

Usage
To run, load the file into IRB
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
`holger.account.pin_code
holger.account.exp_date`

holger.deposit(100)
atm.withdraw(50, 1279, holger.account)

holger.account.balance

holger.go_to_work(100)
``` 
