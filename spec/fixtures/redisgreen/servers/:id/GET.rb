title "Get server status"
summary "This endpoint allows you to get the status of a RedisGreen server."
requires_auth true

param "random", {
  type: "number",
  summary: "Give us a *random* number or we'll shoot this dog."
}

param "language", {
  type: "string",
  optional: true,
  allowed: %w{ english french spanish },
  summary: "Change the language of the response."
}

example_response({
  id: "23412345",
  running: "true"
})
