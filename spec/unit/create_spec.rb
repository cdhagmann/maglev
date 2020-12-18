require 'maglev/commands/create'

RSpec.describe Maglev::Commands::Create do
  it "executes `create` command successfully" do
    output = StringIO.new
    name = nil
    options = {}
    command = Maglev::Commands::Create.new(name, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
