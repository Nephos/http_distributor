module HttpDistributor
  alias NumericValue = Float32 | Float64 | Int32 | Int64
end

require "./http_distributor/*"
require "secure_random"

$config = HttpDistributor::Configuration.new
$client = HttpDistributor::Client.new($config)
$domains = Hash(String, HttpDistributor::Domain).new
$auth_token = ENV["AUTH_TOKEN"]? || SecureRandom.hex(8)

STDERR.puts "AUTH_TOKEN IS: #{$auth_token}"
