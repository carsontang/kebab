require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'sinatra'
require "#{File.dirname(__FILE__)}/models/order"

# Set up the environment
env_index = ARGV.index("-e")
env_arg = ARGV[env_index + 1] if env_index
env = env_arg || ENV["SINATRA_ENV"] || "development"
databases = YAML.load_file("config/database.yml")
ActiveRecord::Base.establish_connection(databases[env])

# create an order
post '/orders' do
  begin
      order = Order.create(params[:order])
      if order.valid?
        #o = { :created_at => "#{order.created_at}#{Random.rand(1000000..9999999)}".gsub(/ /, "").gsub(/:/, "") }
        #o.to_json
        
        # Return confirmation number, change order model in db
        # Figure out how to redirect with sinatra
        "#{order.created_at}#{Random.rand(1000000..9999999)}".gsub(/ /, "").gsub(/:/, "")
      else
        error 400, order.errors.to_json
      end
  rescue => e
    error 400, e.message.to_json
  end
end
