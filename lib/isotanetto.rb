class Isotanetto
  def self.analyze_files(filenames)
    texts = filenames.map{|filename| File.read(filename)}
    isotanetto = new(texts)
    STDOUT.puts isotanetto.output
  end

  def initialize(texts)
    tokens_in_words_by_text = texts.map do |text|
      alphabetical_expressions = text.scan(/[a-zA-Z]+/)
      alphabetical_expressions
    end
    tokens = tokens_in_words_by_text.flatten(1)
    @token_frequencies = Hash[tokens.group_by{|token| token}.map{|key, array| [key, array.count]}]
  end

  def output
    @token_frequencies.sort.map{|key, count| [key, count].join("\t")}.join("\n")
  end
end
