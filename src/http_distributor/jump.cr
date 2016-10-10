require "uri"

module HttpDistributor
  # Handle the redistribution of the request.
  class Jump
    @base : URI
    @ping : Float64

    getter base, ping

    def initialize(@base, @ping)
    end

    def initialize(domain : String, @ping)
      @base = URI.parse(domain)
    end

    def to_h
      {
        "base" => @base.to_s,
        "ping" => @ping,
      }
    end
  end
end
