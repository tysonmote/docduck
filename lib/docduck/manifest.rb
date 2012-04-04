module DocDuck
  # Read in a manifest file
  class Manifest < Parser
    nowrap_markdown_attrs :title
    markdown_attrs :summary

    attr_reader :resources

    def initialize( path )
      @path = path
      @resources = []
      instance_eval( File.read( path ) )
    end

    def dirname
      File.dirname( @path )
    end

    def resource( directory, label = directory.capitalize )
      path = File.join( dirname, directory )
      @resources << Resource.new( label, path, self )
    end
  end
end
