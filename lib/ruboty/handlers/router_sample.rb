module Ruboty
  module Handlers
    class RouterSample < Base
      router(
        '/ping',
        name: 'ping',
        method: 'get'
      )

      def ping(_env, _params = {})
        robot.receive(body: "@#{robot.name} ping", source: 'Router')
        'ok'
      end
    end
  end
end
