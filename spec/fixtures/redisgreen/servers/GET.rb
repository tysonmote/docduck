name "Servers"
summary <<-TXT
Returns a list of your servers, ordered my creattion date, ascending.
TXT
requires_auth true

response_body([
  {
    id: "23412345",
    created_at: "2012-04-04 04:39:11 UTC",
    label: "Production cache",
    running: true
  },
  {
    id: "45236264",
    created_at: "2012-01-17 13:24:15 UTC",
    label: "Test bloom filter",
    running: false
  }
])
