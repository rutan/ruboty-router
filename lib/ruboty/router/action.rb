module Ruboty
  module Router
    class Action
      def initialize(pattern, options = {})
        @pattern = pattern
        @options = options
      end

      attr_reader :pattern

      def name
        (@options[:name] || method).to_s
      end

      def method
        (@options[:method] || 'get').to_s
      end
    end
  end
end
