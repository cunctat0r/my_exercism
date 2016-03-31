#
class WordProblem
  OPERATIONS = {
    plus: '.+',
    minus: '.-',
    multiplied: '.*',
    divided: './'
  }.freeze

  def initialize(question)
    @question = question
  end

  def answer
    parse(@question)
  end

  private

  def parse(question)
    raise ArgumentError if question.scan(/\d+/).length < 2
    raise ArgumentError unless question =~ /^What/
    eval(
      question.chop.split(' ').each_with_object('') do |elem, result|
        result << "(#{elem})" if elem =~ /\d+/
        result << OPERATIONS[elem.to_sym] if OPERATIONS[elem.to_sym]
      end
    )
  end
end
