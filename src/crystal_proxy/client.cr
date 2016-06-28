require "http/client"
require "crystal_random_agent"

module CrystalProxy
  class Client

    @config : CrystalProxy::Configuration
    @headers : HTTP::Headers

    def initialize(@config)
      @headers = Client.generate_headers
    end

    def self.generate_headers
      #        "GET": "/api/HTTP/Headers.html HTTP/1.1",
      #"Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
      #"Referer": http://....
      HTTP::Headers.new({
        "User-Agent": random_user_agent,
        "Accept-Language": "en-US,en;q=0.5",
        "Accept-Encoding": "gzip, deflate",
        "DNT": "1",
        "Connection": "keep-alive",
        "Cache-Control": "max-age=0"
      })
    end

    def self.random_user_agent
      CrystalRandomAgent.get_random_user_agent
    end

  end
end
