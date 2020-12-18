# frozen_string_literal: true

require_relative '../command'

module Maglev
  module Commands
    class Create < Maglev::Command
      def initialize(name, options)
        @name = name
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts @name
        result = prompt.collect do
          key(:name).ask("Name?")

          key(:age).ask("Age?", convert: :int)

          key(:address) do
            key(:street).ask("Street?", required: true)
            key(:city).ask("City?")
            key(:zip).ask("Zip?", validate: /\A\d{3}\Z/)
          end
        end
        p result
      end
    end
  end
end
