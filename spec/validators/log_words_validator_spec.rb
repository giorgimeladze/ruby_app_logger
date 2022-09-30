# frozen_string_literal: true

require_relative '../../lib/validators/log_words_validator'

RSpec.describe LogWordsValidator, type: :helper do
  context 'validations' do
    it 'raises error for more than two words in line' do
      line_words = ['/home', '1.1.1.1', 'ok']
      expect { subject.validate(line_words) }.to raise_error(LogFileWordsCountError)
    end
  end
end
