# frozen_string_literal: true

require_relative '../validators/log_ip_validator'
require_relative '../validators/log_path_validator'
require_relative '../validators/log_words_validator'
require_relative '../services/log_file_processor'
require_relative '../services/log_file_reader'

class LogFileAdapter
  attr_reader :file_name, :file_processor, :file_reader

  def initialize(file_name, ip_validator = LogIpValidator, path_validator = LogPathValidator, words_validator = LogWordsValidator, file_processor = LogFileProcessor, file_reader = LogFileReader)
    @file_name = file_name
    @file_reader = file_reader.new(@file_name, ip_validator.new, path_validator.new, words_validator.new)
    @file_processor = file_processor.new
  end

  def output_content
    read_file_output = file_reader.line_words_array
    file_processor.convert_to_hash(read_file_output)
  end
end
