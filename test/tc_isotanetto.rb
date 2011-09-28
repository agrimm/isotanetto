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

  def test_case_insensitive
    text = "MyClass my_class"
    expected_output_portion = "my\t2"
    failure_message = "Not case insensitive"
    isotanetto = Isotanetto.new([text])
    actual_output = isotanetto.output
    assert actual_output.include?(expected_output_portion), failure_message
  end

  def test_dont_split_all_caps
    text = "MY_CONSTANT"
    expected_output_portion = "constant\t1"
    failure_message = "Splits up all caps"
    isotanetto = Isotanetto.new([text])
    actual_output = isotanetto.output
    assert actual_output.include?(expected_output_portion), failure_message
  end
end
