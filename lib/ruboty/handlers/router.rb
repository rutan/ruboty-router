module Ruboty
  module Handlers
    class Router < Base
      def initialize(robot)
        # run monkey patch code
        robot.router_init
        super
      end
    end
  end
end
