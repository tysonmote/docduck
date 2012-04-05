name "Update server"
auth_required true

param "name", {
  optional: true,
  type: "string"
}

param "size_mb", {
  optional: true,
  type: "integer",
  summary: <<-TXT
    If given, the database will be resized to this capacity, in MB. If this
    value is less than the current size of your database, an error will be
    returned.
  TXT
}
