module DocDuck
  # POST.rb, GET.rb, PUT.rb, DELETE.rb
  class Endpoint < Parser
    ACTIONS = %w{ POST GET PUT DELETE }

    nowrap_markdown_attrs :name
    markdown_attrs :summary
    boolean_attrs :requires_auth
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
      if opts.key?( :summary )
        opts[:summary] = Helpers.nowrap_markdown( opts[:summary] )
      end
      @params[name.to_sym] = opts
    end

  end
end
