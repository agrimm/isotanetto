$:<< File.join(File.dirname(__FILE__), "..", "lib")

require "test/unit"
require "isotanetto"

class TestIsotanetto < Test::Unit::TestCase
  def test_split_underscores
    text = "analyze_files"
    expected_output_portion = "analyze\t1"
    failure_message = "Can't split underscores"
    isotanetto = Isotanetto.new([text])
    actual_output = isotanetto.output
    assert actual_output.include?(expected_output_portion), failure_message
  end

  def test_split_camel_case
    text = "camelCase"
    expected_output_portion = "camel\t1"
    failure_message = "Can't split camel case"
    isotanetto = Isotanetto.new([text])
    actual_output = isotanetto.output
    assert actual_output.include?(expected_output_portion), failure_message
  end
end
