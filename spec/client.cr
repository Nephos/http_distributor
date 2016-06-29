require "kemal"
require "../src/crystal_proxy"
require "../src/proxy/helpers/*"
require "../src/proxy/*"

describe CrystalProxy::Client do
  it "basics" do
    puts "Basic"
    d = CrystalProxy::Client.new(CrystalProxy::Configuration.new)

    CrystalProxy::Client.req.get("http://google.fr/", d.headers) do |response|
      puts response.body_io.gets_to_end
    end
  end

  it "real usage case" do
    host = "localhost"
    #$domains[host] = CrystalProxy::Domain.new($config)
    spawn { Kemal.run }
    sleep 0.1
    `curl "http://localhost:3000/config"`
    `curl "http://localhost:3000/get/aHR0cDovL2dvb2dsZS5mcg=="`
  end
end
