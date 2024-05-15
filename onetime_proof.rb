#onetime_proof.rb

require 'dotenv'
require 'httparty'
require 'json'


Dotenv.load
Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'models', '*.rb')].each { |file| require file }

module OnetimeCreate
  class OnetimeOrder

    def initialize
        @recharge_access_token = ENV['RECHARGE_ACCESS_TOKEN']
        @my_change_header = {"X-Recharge-Version" => '2021-11',
        "Content-Type" => 'application/json',
        "X-Recharge-Access-Token" => @recharge_access_token}
        @my_header = {"X-Recharge-Version" => '2021-11',
        "X-Recharge-Access-Token" => @recharge_access_token}
    end

    def create_onetime_order
        puts "Starting ..."
        #https://developer.rechargepayments.com/2021-11/onetimes/onetimes_create

        my_body = {
            "address_id" => 151404707,
            "next_charge_scheduled_at" => "2024-05-15",
            "price" => 0.0,
            "product_title" => "Dress To Impress - 3 Items",
            "properties" => [
              {
                "name" => "product_collection",
                "value" => "Dress To Impress - 3 Items"
              },
              {
                "name" => "sports-bra",
                "value" => "M"
              },
              {
                "name" => "tops",
                "value" => "M"
              },
              {
                "name" => "dress",
                "value" => "M"
              },
              {
                "name" => "leggings",
                "value": "M"
              },
              {
                "name" => "sports-jacket",
                "value" => "M"
              }
            ],
            "quantity" => 1,
            "external_variant_id" => {
                "ecommerce" => "43075911712929"
            }
        }

        


        create_onetime = HTTParty.post("https://api.rechargeapps.com/onetimes", :headers => @my_change_header, :body => my_body.to_json, :timeout => 90)

        puts create_onetime.inspect

    end

    def get_charge_associated
        puts "starting to get charge id"

        #GET /charges?address_id=:address_id
        #GET /charges?scheduled_at=2016-06-18

        get_charges = HTTParty.get("https://api.rechargeapps.com/charges?limit=15&address_id=151404707&scheduled_at=2024-05-15", :headers => @my_header, :body => {})

        puts get_charges.inspect

    end

    def charge_now
        charge_id = 1080204865
        #POST /charges/{id}/process

        process_charge = HTTParty.post("https://api.rechargeapps.com/charges/#{charge_id}/process", :headers => @my_change_header, :body => {})

        puts process_charge.inspect

    end


  end
end