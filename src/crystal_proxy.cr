module CrystalProxy
  alias NumericValue = Float32 | Float64 | Int32 | Int64
end

require "./crystal_proxy/*"
require "secure_random"

$config = CrystalProxy::Configuration.new
$client = CrystalProxy::Client.new($config)
$domains = Hash(String, CrystalProxy::Domain).new
$auth_token = ENV["AUTH_TOKEN"]? || SecureRandom.hex(8)

STDERR.puts "AUTH_TOKEN IS: #{$auth_token}"
