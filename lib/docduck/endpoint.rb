module DocDuck
  # POST.rb, GET.rb, PUT.rb, DELETE.rb
  class Endpoint < Accumulator
    ACTIONS = %w{ POST GET PUT DELETE }

    nowrap_markdown_attrs :name
    markdown_attrs :summary
    boolean_attrs :auth_required
    hash_attrs :response_body

    attr_reader :method, :params

    def initialize( path, resource )
      @method = File.basename( path, ".rb" )
      @resource = resource
      @params = {}
      instance_eval( File.read( path ) )
    end

    def url
      @resource.url
    end

    def param( name, options = {} )
      opts = {
        type: "string",
        optional: false
      }.merge( options )
      if opts[:summary]
        opts[:summary] = Helpers.nowrap_markdown( opts[:summary] )
      end
      @params[name.to_sym] = opts
    end

    def to_html
      template = Tilt.new( File.join( TEMPLATE_ROOT, "endpoint.slim" ) )
      template.render( self )
    end
  end
end
