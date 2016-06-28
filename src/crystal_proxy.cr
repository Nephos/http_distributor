module CrystalProxy
  alias NumericValue = Float32 | Float64 | Int32 | Int64
end

require "./crystal_proxy/*"
require "kemal"

$config = CrystalProxy::Configuration.new
$client = CrystalProxy::Client.new($config)
$domains = Hash(String, CrystalProxy::Domain).new
require "./crystal_proxy/server/*"
