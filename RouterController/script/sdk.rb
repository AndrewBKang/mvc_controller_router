require 'singleton'
require 'addressable/uri'
require 'json'
require 'rest-client'

class Session
  include Singleton

  URI = Addressable::URI.new(
          scheme: 'http',
          host: 'localhost',
          port: 3000)

  def self.get(uri)
    uri.query_values = {:token => @token}
    RestClient.get(uri.to_s)
  end

  def self.put(uri,query)
    uri.query_values = {:token => @token}
    RestClient.put(uri.to_s,query)
  end

  def self.post(uri,query)
    uri.query_values = {:token => @token}
    RestClient.put(uri.to_s,query)
  end

  def initialize
    uri = URI.dup
    uri.path = 'user/login.json'
    puts "email:"
    email = "jones@gmail.com"
    query = {:email => email}
    p query
    p uri.to_s
    response = RestClient.post(uri.to_s, query)
    p response
    @token,@user_id = JSON.parse(response)
  end

  def get_token
    ur
  end

  def show
    uri = URI.dup
    uri.path = '/user.json'
    JSON.parse(Session.get(uri.to_s))
  end

end