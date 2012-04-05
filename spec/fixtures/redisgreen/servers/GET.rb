name "Servers"
summary <<-TXT
Get all of your servers.
TXT
requires_auth true

response_body([
  {
    "id"=>15,
    "name"=>"my_production_db",
    "status"=>"running",
    "size_mb"=>128,
    "dns"=>"api.redisgreen.net",
    "port"=>83612,
    "created_at"=>"2012-04-05T22:57:06Z",
    "updated_at"=>"2012-04-05T22:57:06Z",
    "user_id"=>11
  },
  {
    "id"=>315,
    "name"=>"my_test_db",
    "status"=>"launching",
    "size_mb"=>2,
    "dns"=>"api.redisgreen.net",
    "port"=>88262,
    "created_at"=>"2012-04-05T22:57:06Z",
    "updated_at"=>"2012-04-05T22:57:06Z",
    "user_id"=>11
  }
])
