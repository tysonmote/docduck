group :test do
  gem 'guard-rspec'

  guard 'rspec', :version => 2 do
    watch(%r{^spec/.+_spec\.rb$})
    watch('lib/docduck.rb')           { "spec" }
    watch(%r{^spec/fixtures/.+$})     { "spec" }
    watch(%r{^templates/.+$})         { "spec" }
    watch(%r{^lib/docduck/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')      { "spec" }
  end
end

group :development do
  gem 'guard-shell'

  guard :shell, all_on_startup: true do
    watch /\.(rb|slim)$/ do
      `./bin/build_redisgreen > redisgreen.html`
      puts "HTML generated"
    end
  end
end
