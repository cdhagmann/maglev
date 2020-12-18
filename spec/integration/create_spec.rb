RSpec.describe "`maglev create` command", type: :cli do
  it "executes `maglev help create` command successfully" do
    output = `maglev help create`
    expected_output = <<-OUT
Usage:
  maglev create NAME

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
