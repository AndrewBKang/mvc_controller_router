require 'addressable/uri'
require 'rest-client'
require 'json'

user = {:user=>{:email => 'james@gmail.com'}}
#:name => 'michael',

query = {:user => {:name => "mike"} }
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/4.json',
#  query_values: query
).to_s

p JSON.parse(RestClient.delete(url))