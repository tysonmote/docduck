name "Update user information"

requires_auth true

param "name", {
  type: "string",
}

response_body({
  name: "Bob Smith",
  email: "foo@bar.com"
})
