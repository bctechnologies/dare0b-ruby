require "rexml/document"
require "rexml/xpath"

class Transformer

  def process_xml input, output
    doc_in = REXML::Document.new(input)
    doc_out = REXML::Document.new('<document></document>')
    REXML::XPath.each(doc_in, '/document/item') do |item|
      doc_out.root << item
    end
    doc_out.write output
  end

end
