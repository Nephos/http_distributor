require "./crystal_proxy"

def authorized?(env)
  env.params.query["auth_token"]? == $auth_token
end

error 403 do
  "Access Forbidden!\n"
end

before_all do |env|
  env.response.status_code = 403 unless authorized? env
end

Kemal.run
