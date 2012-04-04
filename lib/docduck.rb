require "docduck/version"
require "jbuilder"

module DocDuck
  module Helpers
    def subdirectories( path )
      Dir["#{path}/*"].select{ |subpath| File.directory?( subpath ) }.sort
    end
  end

  class Converter
    include Helpers

    attr_reader :resources

    def initialize( path )
      @path = path
      @manifest = Manifest.new( File.join( @path, "manifest.rb" ) )
      @resources = subdirectories( @path ).map do |path|
        Resource.new( path, @manifest )
      end
    end
  end
end

require "docduck/parser"
require "docduck/manifest"
require "docduck/endpoint"
require "docduck/resource"
