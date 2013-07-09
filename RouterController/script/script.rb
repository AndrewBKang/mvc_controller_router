require 'addressable/uri'
require 'rest-client'
require 'json'

fave = {:user=>{:favorite => true}}
user = {:user => {:email => 'stab@gmail.com'}}
contact = {:contact =>{:favorite => true}}


url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'contacts.json',
  #query_values: {"token"=>"NPHr57syxHFqu5zZ0h6RBA=="}
).to_s

p JSON.parse(RestClient.get(url))