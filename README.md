# ShowJsonExceptions - For Rails, of course

Rails catches exceptions within a ShowExceptions middleware and renders out a HTML error - in some cases you want an error be rendered as JSON for APIs consuming the app in question. This does just that.

## Installation

Add this line to your application's Gemfile:

    gem 'show_json_exceptions'

And then execute:

    $ bundle

## Usage

There is nothing to do here, the railtie hooks in the middleware automatically. You can confirm the middleware has been loaded by running:

	rake middleware

When an error occurs in your application you will see a response similar to the following:

    {
    	"successful": false,
    	"result": {},
    	"error_messages": ["Exception: No route matches [GET] \"/non/existent\"]
    }

If your application is running in development mode you will also see a backtrace in your error_messages array:

	{
    	"successful": false,
    	"result": {},
    	"error_messages": [
    		"Exception: No route matches [GET] \"/non/existent\",
    		{
    			"backtrace": [
    			# ... Backtrace lines here as an array...
    			]
    		}
    	]
    }

## No tests?

Yes well, this is really a simple gem.. in fact you can just add the module and the config.middleware statements yourself, but I wanted to wrap this in a gem for reuse. If you really think it needs tests then bug me and I'll see what I can do...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
