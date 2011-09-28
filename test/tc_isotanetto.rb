$:<< File.join(File.dirname(__FILE__), "..", "lib")

require "test/unit"
require "isotanetto"

class TestIsotanetto < Test::Unit::TestCase
  def test_split_underscores
    text = "analyze_files"
    expected_output_portion = "analyze\t1"
    isotanetto = Isotanetto.new([text])
    actual_output = isotanetto.output
    assert actual_output.include?(expected_output_portion), "Can't split underscores"
  end
end