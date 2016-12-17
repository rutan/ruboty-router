require 'ruboty'

module Ruboty
  class Robot
    def router_init
      instance_eval do
        alias __ruboty_router_adapt adapt
        def adapt
          router
          register_routes
          __ruboty_router_adapt
        end
      end
    end

    def router
      ::Ruboty::Router::Server.new
    end
    memoize :router

    def register_routes
      handlers.each do |handler|
        router.register(handler)
      end
    end
  end

  module Handlers
    class Base
      class << self
        def router(pattern, options = {})
          routers << ::Ruboty::Router::Action.new(pattern, options)
        end

        def routers
          []
        end
        memoize :routers
      end
    end
  end
end
