# Observation

Observation lets you add a simple event system to any Ruby class.
Use it to decrease coupling between your objects.

## Installation

Add this line to your application's Gemfile:

    gem 'observation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install observation

## Example

    class Foo
      include Observation::Dispatcher

      def do_something
        dispatch('some_event', :my_key => 'some_value')
      end
    end

    f = Foo.new
    callback = proc { |event_type, data, target|
      puts "Event handler called! event_type=#{event_type}, data=#{data}, target=#{target}"
    }

    f.add_listener('some_event', callback)
    f.do_something

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
