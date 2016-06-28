require "json"

get "/domains" do |env|
  env.response.content_type = "application/json"
  $domains.map do |host, dom|
    [host, {"next_usage_at" => dom.next_usage_at.to_s, "usage_count" => dom.usages.size}]
  end.to_h.to_json
end
