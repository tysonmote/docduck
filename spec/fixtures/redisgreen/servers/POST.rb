name "Create server"
summary "Allocates and starts a new Redis instance."
requires_auth true

param "label", {
  optional: true,
  summary: "The human-readable label for this Redis instance."
}

param "size", {
  type: "number",
  optional: false,
  summary: "The size, in megabytes, of this Redis instance."
}

response_body({
  id: "13335149146075032",
  label: "New redis database",
  created_at: "2012-04-04 04:48:05 UTC",
  running: true
})
