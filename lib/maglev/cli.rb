# frozen_string_literal: true

require 'thor'

module Maglev
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'maglev version'
    def version
      require_relative 'version'
      puts "v#{Maglev::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'create NAME', 'Create a new rails app'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :interactive, type: :boolean, aliases: ['-i'],
                         desc: "Allows for interactive creation of rails app"
    method_option :verbose, type: :boolean, aliases: ['-v'],
                         desc: "Verbose creation"
    def create(name = nil)
      if options[:help]
        invoke :help, ['create']
      else
        require_relative 'commands/create'
        Maglev::Commands::Create.new(name, options).execute
      end
    end
  end
end
