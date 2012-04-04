require "docduck/version"
require "jbuilder"
require 'rdiscount'

module DocDuck
  module Helpers
    def self.subdirectories( path )
      Dir["#{path}/*"].select{ |subpath| File.directory?( subpath ) }.sort
    end

    def self.markdown( markdown )
      RDiscount.new( markdown ).to_html.strip
    end

    def self.nowrap_markdown( markdown )
      markdown( markdown ).gsub( /^<p>/, '' ).gsub( /<\/p>$/, '' )
    end
  end

  class Converter
    attr_reader :resources

    def initialize( path )
      @path = path
      @manifest = Manifest.new( File.join( @path, "manifest.rb" ) )
      @resources = Helpers.subdirectories( @path ).map do |path|
        Resource.new( path, @manifest )
      end
    end
  end
end

require "docduck/parser"
require "docduck/manifest"
require "docduck/endpoint"
require "docduck/resource"
