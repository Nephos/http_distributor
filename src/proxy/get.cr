private def root_get_url(env)
  url = env.params.url["url"]?
  return "No url base64 encoded provided..." if url.nil?

  begin
    url = Base64.decode_string(url).strip
    host = URI.parse(url).host.to_s
  rescue err
    STDERR.puts err
    env.response.status_code = 400
    return "Invalid url \"#{url}\""
  end

  DOMAINS[host] = HttpDistributor::Domain.new(CONFIG) unless DOMAINS[host]?
  DOMAINS[host].use do
    begin
      CLIENT.exec("GET", url) do |res|
        res.body_io.gets_to_end
      end
    rescue err
      STDERR.puts "Error fetching: \"#{url}\": #{err}"
    end
  end
end

get "/get/:url" do |env|
  root_get_url env
end
