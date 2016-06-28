describe CrystalProxy::Client do
  it "basics" do
    puts "Basic"
    d = CrystalProxy::Client.new(CrystalProxy::Configuration.new)

    CrystalProxy::Client.req.get("http://google.fr/", d.headers) do |response|
      puts response.body_io.gets_to_end
    end
  end
end
