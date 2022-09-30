# frozen_string_literal: true

class LogFileReader
  attr_reader :file_name, :ip_validator, :path_validator, :words_validator

  def initialize(file_name, ip_validator, path_validator, words_validator)
    @file_name = file_name
    @ip_validator = ip_validator
    @path_validator = path_validator
    @words_validator = words_validator
  end

  def line_words_array
    log_file_words_array = []
    File.open(file_name, 'r').each_line do |line|
      line_words = line.strip.split
      words_validator.validate(line_words)
      path_validator.validate(line_words.first)
      ip_validator.validate(line_words.last)

      log_file_words_array << line_words
    end
    log_file_words_array
  end
end
