module DocDuck
  class Manifest < Parser
    nowrap_markdown_attrs :title
    markdown_attrs :summary
    array_attrs :order

    def initialize( path )
      @path = path
      instance_eval( File.read( path ) )
    end

    def dirname
      File.dirname( @path )
    end
  end
end
