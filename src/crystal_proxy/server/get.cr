get "/get/:url" do |env|
  url = env.params.url["url"]?
  if url
    url = Base64.decode_string(url).strip
    host = URI.parse(url).host.to_s
    $domains[host] = CrystalProxy::Domain.new($config) unless $domains[host]?
    $domains[host].use do
      $client.req.get(url, $client.headers) do |res|
        res.body_io.gets_to_end
      end
    end
  else
    "No url base64 encoded provided..."
  end
end
