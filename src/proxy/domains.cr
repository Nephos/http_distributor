require "json"

get "/domains" do |env|
  env.response.content_type = "application/json"
  DOMAINS.map do |host, dom|
    [host, dom.to_h]
  end.to_h.to_json
end
