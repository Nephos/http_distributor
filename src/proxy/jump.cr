require "json"

get "/jump" do |env|
  env.response.content_type = "application/json"
  JUMPS.map_with_index{|j, i| {"id" => i}.merge(j.to_h) }.to_json
end

private def jump_add_url(env)
  url = env.params.url["url"]?
  return "No url base64 encoded provided..." if url.nil?

  begin
    url = Base64.decode_string(url).strip
    ping = HttpDistributor::Delay.to { HTTP::Client.get(url + "?auth_token=#{AUTH_TOKEN}") }
    JUMPS << HttpDistributor::Jump.new url, ping
  rescue err
    STDERR.puts
    env.response.status_code = 400
    return "Invalid url \"#{url}\""
  end
  return JUMPS.last.to_h.to_json
end

get "/jump/add/:url" do |env|
  jump_add_url env
end

get "/jump/delete/:id" do |env|
  id = env.params.url["id"]?
  if id
    j = JUMPS.delete_at(id.to_i)
    "the jump #{id} has been deleted (#{j.base.to_s})"
  else
    "No id provided..."
  end
end
