module DocDuck
  # A directory of endpoints.
  class Resource
    attr_reader :endpoints, :subresources

    def initialize( path, manifest )
      @path = path
      @manifest = manifest
      @endpoints = Endpoint::ACTIONS.inject([]) do |specs, action|
        file_path = "#{@path}/#{action}.rb"
        specs << Endpoint.new( file_path, self ) if File.exists?( file_path )
        specs
      end
      @subresources = Helpers.subdirectories( @path ).sort.map do |subpath|
        Resource.new( subpath, @manifest )
      end
    end

    def url
      @path.sub( @manifest.dirname, '' )
    end
  end
end
