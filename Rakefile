require 'dotenv'

require_relative 'onetime_proof'

Dotenv.load



namespace :onetime_proof_concept do
  desc 'Create Onetime order zero dollars as proof concept'
  task :create_onetime do |t|
    OnetimeCreate::OnetimeOrder.new.create_onetime_order
  end

  desc 'Get charge associated with one time order'
  task :get_charge_associated do |t|
    OnetimeCreate::OnetimeOrder.new.get_charge_associated
  end

  desc 'Charge Now to create order'
  task :charge_now do |t|
    OnetimeCreate::OnetimeOrder.new.charge_now
  end

end
