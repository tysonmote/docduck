name "Server status"
summary "Returns information about the state of a Redis database."
auth_required true

response_body({
    "id"=>15,
    "name"=>"my_production_db",
    "status"=>"running",
    "size_mb"=>128,
    "dns"=>"api.redisgreen.net",
    "port"=>83612,
    "created_at"=>"2012-04-05T22:57:06Z",
    "updated_at"=>"2012-04-05T22:57:06Z",
    "user_id"=>11
})
