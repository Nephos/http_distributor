puts
puts "-------- proxy.cr --------"
puts

require "kemal"
require "./crystal_proxy"
require "./proxy/helpers/*"
require "./proxy/*"

Kemal.run
