# Guide to Creating a Free One Time Order in Recharge and Pushing the Order Immediately

## How to Run the Rake Tasks
1. First run rake task to create the runtime 
```ruby
rake onetime_proof_concept:create_onetime
```
2. Second run rake task to get charges associated with the onetime
```ruby
rake onetime_proof_concept:get_charge_associated
```
3.  Third, save the charge id and use it run the final rake task to make Recharge push the charge and order immediately
```ruby
rake onetime_proof_concept:charge_now
```