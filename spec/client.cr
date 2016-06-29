require "kemal"
#require "../src/http_distributor_lib"
require "../src/helpers/*"
require "../src/proxy/*"

describe HttpDistributor::Client do
  it "basics" do
    puts "Basic"
    d = HttpDistributor::Client.new(HttpDistributor::Configuration.new)

    HttpDistributor::Client.req.get("http://google.fr/", d.headers) do |response|
      puts response.body_io.gets_to_end
    end
  end

  it "real usage case" do
    host = "localhost"
    #$domains[host] = HttpDistributor::Domain.new($config)
    spawn { Kemal.run }
    sleep 0.1
    `curl "http://localhost:3000/config"`
    `curl "http://localhost:3000/get/aHR0cDovL2dvb2dsZS5mcg=="`
  end
end
