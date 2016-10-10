require "./*"
require "secure_random"

CONFIG = HttpDistributor::Configuration.new
CONFIG.change_agent_probability = ENV["change_agent_probability"].to_f if ENV["change_agent_probability"]?
CONFIG.wait_fixed = ENV["wait_fixed"].to_f if ENV["wait_fixed"]?
CONFIG.wait_random = ENV["wait_random_min"].to_f..ENV["wait_random_max"].to_f if ENV["wait_random_min"]? && ENV["wait_random_max"]?
CONFIG.wait_delay_coefficient = ENV["wait_delay_coefficient"].to_f if ENV["wait_delay_coefficient"]?

CLIENT = HttpDistributor::Client.new(CONFIG)
DOMAINS = Hash(String, HttpDistributor::Domain).new
AUTH_TOKEN = ENV["AUTH_TOKEN"]? || SecureRandom.hex(8)
JUMPS = Array(HttpDistributor::Jump).new

STDERR.puts "AUTH_TOKEN IS: #{AUTH_TOKEN}"
