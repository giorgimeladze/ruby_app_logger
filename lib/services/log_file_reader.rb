# frozen_string_literal: true

class LogFileReader
  attr_reader :file_name, :hash_validator

  def initialize(file_name, hash_validator)
    @file_name = file_name
    @hash_validator = hash_validator
  end

  def line_words_array
    log_file_words_array = []
    File.open(file_name, 'r').each_line do |line|
      line_words = line.strip.split
      hash_validator.validate_line_words(line_words)

      log_file_words_array << line_words
    end
    log_file_words_array
  end
end
