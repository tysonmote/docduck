title "Update user information"

requires_auth true

param( "name", {
  type: "string",
})

example_response({
  name: "Bob Smith",
  email: "foo@bar.com"
})
