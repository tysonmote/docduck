require 'bundler'
Bundler.require

def fixture_path( name )
  "#{Dir.pwd}/spec/fixtures/#{name}"
end

def sample_manifest
  DocDuck::Manifest.new( fixture_path( "redisgreen/manifest.rb" ) )
end
