def authorized?(env)
  AUTH_TOKEN == nil || env.params.query["auth_token"]? == AUTH_TOKEN
end

error 403 do
  "Access Forbidden!\n"
end

before_all do |env|
  env.response.status_code = 403 unless authorized? env
end
