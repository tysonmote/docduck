name "Create server"
summary "Allocates and starts a new Redis instance."
requires_auth true

param "name", {
  optional: true,
  summary: "The human-readable label for this Redis instance."
}

param "size_mb", {
  type: "number",
  optional: false,
  summary: "The size, in megabytes, of this Redis instance."
}

response_body(  {
  "id"=>315,
  "name"=>"my_test_db",
  "status"=>"launching",
  "size_mb"=>2,
  "dns"=>"api.redisgreen.net",
  "port"=>88262,
  "created_at"=>"2012-04-05T22:57:06Z",
  "updated_at"=>"2012-04-05T22:57:06Z",
  "user_id"=>11
})
