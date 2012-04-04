group :test do
  gem 'guard-rspec'
end

guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch('lib/docduck.rb')           { "spec" }
  watch(%r{^spec/fixtures/.+$})     { "spec" }
  watch(%r{^templates/.+$})         { "spec" }
  watch(%r{^lib/docduck/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')      { "spec" }
end
