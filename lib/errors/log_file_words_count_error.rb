# frozen_string_literal: true

class LogFileWordsCountError < StandardError
  def message
    'Two words should be in each line'
  end
end
