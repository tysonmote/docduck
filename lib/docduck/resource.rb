module DocDuck
  # A directory of endpoints.
  class Resource
    attr_reader :name, :endpoints, :subresources

    def initialize( name, path, manifest, parent_resource = nil )
      @name = name
      @path = path
      @manifest = manifest
      @parent_resource = parent_resource
      @endpoints = Endpoint::ACTIONS.inject([]) do |specs, action|
        file_path = "#{@path}/#{action}.rb"
        specs << Endpoint.new( file_path, self ) if File.exists?( file_path )
        specs
      end
      @subresources = Helpers.subdirectories( @path ).sort.map do |subpath|
        directory_name = File.basename(subpath)
        if directory_name[0] == ":"
          name = nil
        else
          name = directory_name.capitalize
        end
        Resource.new( name, subpath, @manifest )
      end
    end

    def url
      @path.sub( @manifest.dirname, '' )
    end

    def to_html
      template = Tilt.new( File.join( TEMPLATE_ROOT, "resource.slim" ) )
      template.render( self )
    end
  end
end
