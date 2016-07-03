require "http/client"
require "crystal_random_agent"

module HttpDistributor
  class Client
    @config : Configuration
    @headers : HTTP::Headers

    getter config, headers
    setter config, headers

    def initialize(@config)
      @headers = Client.generate_headers
    end

    def self.generate_headers
      # "GET": "/api/HTTP/Headers.html HTTP/1.1",
      # "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
      # "Referer": http://....
      h = HTTP::Headers{
        "User-Agent"      => Client.random_user_agent,
        "Accept-Language" => "en-US,en;q=0.5",
        "Accept-Encoding" => "gzip, deflate",
        "DNT"             => "1",
        "Connection"      => "keep-alive",
        "Cache-Control"   => "max-age=0",
      }
    end

    def change_user_agent
      @headers["User-Agent"] = Client.random_user_agent
    end

    def self.random_user_agent
      CrystalRandomAgent.get_random_user_agent
    end

    def self.req
      HTTP::Client
    end

    def req
      change_user_agent if rand(0.0..1.0) < @config.change_agent_probability
      HTTP::Client
    end
  end
end
