require "json"

get "/config" do |env|
  env.response.content_type = "application/json"
  $config.to_h.to_json
end
