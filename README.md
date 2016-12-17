# Ruboty::Router

Mount http router to Ruboty.  (like `hubot.router` )

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-router'
```

## Usage

```ruby
class YourHandler < Ruboty::Handlers::Base
  router(
    '/ping',
    name: 'on_ping',
    method: 'get'
  )

  def on_ping(env, params = {})
    obot.receive(body: "@#{robot.name} ping", source: 'Router')
    { result: 'ok' }
  end
end
```

and access to `http://localhost:4567/ping`

## ENV

- PORT
    - HTTP Server Port (default: 4567)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rutan/ruboty-router.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

