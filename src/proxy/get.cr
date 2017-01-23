private def root_get_body(url)
  CLIENT.exec("GET", url) do |res|
    if res.headers["Content-Encoding"]? == "gzip"
      Zlib::Inflate.gzip(res.body_io) do |inflate|
        inflate.gets_to_end
      end
    else
      res.body_io.gets_to_end
    end
  end
end

private def root_extract_url(url)
  url = Base64.decode_string(url).strip
  host = URI.parse(url).host.to_s
  return {url, host}
end

private def root_get(env)
  url = env.params.url["url"]?
  return "No url base64 encoded provided..." if url.nil?

  begin
    url, host = root_extract_url url
  rescue err
    STDERR.puts err
    env.response.status_code = 400
    return "Invalid url \"#{url}\""
  end

  DOMAINS[host] = HttpDistributor::Domain.new(CONFIG) unless DOMAINS[host]?
  DOMAINS[host].use do
    begin
      root_get_body(url)
    rescue err
      STDERR.puts "Error fetching: \"#{url}\": #{err}"
    end
  end
end

get "/get/:url" do |env|
  root_get env
end
