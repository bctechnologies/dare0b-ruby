require 'minitest/autorun'
require 'stringio'

class AssignmentTest < Minitest::Test

  WORK_DIR = File.expand_path('../', __FILE__)

  def test_process_xml_1
    transform_and_compare 'sample1.xml', %Q{<document>\
<item><name>B</name><score>0.5</score></item>\
<item><name>A</name><score>0.8</score></item>\
</document>}
  end

  def test_process_xml_2
    transform_and_compare 'sample2.xml', %Q{<document>\
<item><name>B</name><score>0.1</score></item>\
<item><name>A</name><score>0.2</score></item>\
<item><name>D</name><score>0.6</score></item>\
<item><name>C</name><score>0.9</score></item>\
</document>}
  end

  private
  def transform_and_compare file, expectation
    require 'assignment'
    output = StringIO.new
    File.open(File.join(WORK_DIR, file)) do |input|
      transformer = Transformer.new
      transformer.process_xml input, output
    end
    output.rewind
    assert_equal expectation, output.read
  end

end
