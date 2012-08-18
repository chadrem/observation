#!/usr/bin/env rake

require 'rubygems'
require 'bundler/gem_tasks'

begin
  require 'debugger'
rescue Exception
end

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts(e.message)
  $stderr.puts("Run `bundle install` to install missing gems")
  exit e.status_code
end

task :environment do
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
  require 'observation'
end

desc 'Start an IRB console'
task :console => :environment do
  require 'irb'

  ARGV.clear

  IRB.start
end

desc 'Test harness'
task :harness => :environment do
  class Foo
    include Observation::Dispatcher

    def do_something
      dispatch('bar', :donkey => 'kong')
    end
  end

  f = Foo.new
  callback = proc { |event_type, data, target|
    puts "Event handler called! event_type=#{event_type}, data=#{data}, target=#{target}"
  }

  f.add_listener('bar', callback)
  f.do_something

  f.remove_listener('bar', callback)
  f.do_something
  puts "Types: #{f.listening_event_types}"

  f.add_listener('bar', callback)
  f.do_something

  f.remove_all_listeners('bar')
  f.do_something
end


