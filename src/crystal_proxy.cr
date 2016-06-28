module CrystalProxy
  alias NumericValue = Float32 | Float64 | Int32 | Int64
end

require "./crystal_proxy/*"
require "kemal"
require "./crystal_proxy/server/*"
