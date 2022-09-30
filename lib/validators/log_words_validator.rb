# frozen_string_literal: true

require_relative 'validator'
require_relative '../errors/log_file_words_count_error'

class LogWordsValidator < Validator
  def validate(line_words)
    validate_words(line_words)
  end

  private

  def validate_words(line_words)
    raise LogFileWordsCountError if line_words.size != 2
  end
end
