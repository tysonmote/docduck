module DocDuck
  class Accumulator
    class << self
      def string_attrs( *attrs )
        attrs.each do |name|
          variable = "@#{name}".to_sym

          define_method name do |*attrs|
            if attrs.size == 1
              instance_variable_set( variable, attrs.first )
            else
              instance_variable_get( variable ).to_s.strip
            end
          end
        end
      end

      def markdown_attrs( *attrs )
        attrs.each do |name|
          variable = "@#{name}".to_sym
          string_attrs( name )

          define_method "#{name}_html" do
            Helpers.markdown( instance_variable_get( variable ) )
          end
        end
      end

      def nowrap_markdown_attrs( *attrs )
        attrs.each do |name|
          variable = "@#{name}".to_sym
          string_attrs( name )

          define_method "#{name}_html" do
            Helpers.nowrap_markdown( instance_variable_get( variable ) )
          end
        end
      end

      def direct_attrs( *attrs )
        attrs.each do |name|
          variable = "@#{name}".to_sym
          define_method name do |*attrs|
            if attrs.size == 1
              instance_variable_set( variable, attrs.first )
            else
              instance_variable_get( variable )
            end
          end
        end
      end

      def array_attrs( *attrs )
        direct_attrs( *attrs )
      end

      def hash_attrs( *attrs )
        direct_attrs( *attrs )
      end

      def boolean_attrs( *attrs )
        direct_attrs( *attrs )
      end
    end

  end
end
