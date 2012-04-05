require 'rdiscount'
require 'slim'

Slim::Engine.set_default_options({
  pretty: true,
  tabsize: 2
})

module DocDuck
  TEMPLATE_ROOT = File.expand_path( File.join( File.dirname(__FILE__), "..", "templates" ) )

  module Helpers
    def self.subdirectories( path )
      Dir["#{path}/*"].select{ |subpath| File.directory?( subpath ) }.sort
    end

    def self.markdown( markdown )
      return "" unless markdown
      RDiscount.new( markdown ).to_html.strip
    end

    def self.nowrap_markdown( markdown )
      markdown( markdown ).gsub( /^<p>/, '' ).gsub( /<\/p>$/, '' )
    end
  end
end

require_relative 'docduck/version'
require_relative 'docduck/accumulator'
require_relative 'docduck/manifest'
require_relative 'docduck/endpoint'
require_relative 'docduck/resource'
