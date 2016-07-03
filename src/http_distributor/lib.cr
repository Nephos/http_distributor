require "./*"
require "secure_random"

$config = HttpDistributor::Configuration.new
$config.change_agent_probability = ENV["change_agent_probability"].to_f if ENV["change_agent_probability"]?
$config.wait_fixed = ENV["wait_fixed"].to_f if ENV["wait_fixed"]?
$config.wait_random = ENV["wait_random_min"].to_f..ENV["wait_random_max"].to_f if ENV["wait_random_min"]? && ENV["wait_random_max"]?
$config.wait_delay_coefficient = ENV["wait_delay_coefficient"].to_f if ENV["wait_delay_coefficient"]?

$client = HttpDistributor::Client.new($config)
$domains = Hash(String, HttpDistributor::Domain).new
$auth_token = ENV["AUTH_TOKEN"]? || SecureRandom.hex(8)

STDERR.puts "AUTH_TOKEN IS: #{$auth_token}"
