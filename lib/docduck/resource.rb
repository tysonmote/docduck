module DocDuck
  class Resource
    def initialize( path, manifest )
      @path = path
      @manifest = manifest
    end

    def endpoints
      return @endpoints if @endpoints
      @endpoints = Endpoint::ACTIONS.inject([]) do |specs, action|
        file_path = "#{@path}/#{action}.rb"
        specs << Endpoint.new( file_path, self ) if File.exists?( file_path )
        specs
      end
    end

    def url
      @path.sub( @manifest.dirname, '' )
    end
  end
end
