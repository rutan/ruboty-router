require 'ruboty'
require 'rack'
require 'pendragon'
require 'forwardable'
require 'json'

module Ruboty
  module Router
    class Server
      extend Forwardable

      def initialize
        router
        start
      end

      def_delegators :@router, :route

      def register(handler)
        handler.class.routers.each do |action|
          router.route(action.method, action.pattern, to: create_app_proc(handler, action))
        end
      end

      private

      def start
        @server = Thread.new do
          Rack::Handler::WEBrick.run(router, BindAddress: (ENV['RUBOTY_ENV'] ? 'localhost' : '0.0.0.0'),
                                             Port: (ENV['PORT'] || 4567))
        end
      end

      def router
        @router ||= Pendragon.new do
          get('/') { [200, {}, ['running ruboty-router.']] }
        end
      end

      def create_app_proc(handler, action)
        ->(*_args) do
          begin
            res = handler.method(action.name).call(env, params)
            [200, {}, [(res || 'ok').to_json]]
          rescue => e
            Ruboty.logger.error e
            [500, {}, ['error'.to_json]]
          end
        end
      end
    end
  end
end
