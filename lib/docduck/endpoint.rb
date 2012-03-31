module DocDuck
  # POST.rb, GET.rb, PUT.rb, DELETE.rb
  class Endpoint < Parser
    ACTIONS = %w{ POST GET PUT DELETE }

    nowrap_markdown_attrs :title
    markdown_attrs :summary
    boolean_attrs :requires_auth
    hash_attrs :example_response

    attr_reader :method

    def initialize( path, resource )
      @method = File.basename( path, ".rb" )
      @resource = resource
      instance_eval( File.read( path ) )
    end

    def url
      @resource.url
    end
  end
end
