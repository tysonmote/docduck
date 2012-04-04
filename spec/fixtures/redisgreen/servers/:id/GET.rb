name "Server status"
summary "Returns the current status of a Redis server."
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

response_body({
  id: "23412345",
  running: "true"
})
