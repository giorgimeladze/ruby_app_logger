# frozen_string_literal: true

require 'set'
require_relative '../validators/uri_hash_validator'
require_relative 'log_file_adapter'

class LogToHashAdapter
  attr_reader :file_name, :hash_validator, :file_adapter

  def initialize(file_name, hash_validator = UriHashValidator, file_adapter = LogFileAdapter)
    @file_name = file_name
    @hash_validator = hash_validator.new
    @file_adapter = file_adapter.new(file_name)
  end

  def convert_to_hash
    hash_validator.validate_file_name(file_name)

    file_adapter.output_content
  rescue Errno::ENOENT
    { message: 'Correct Log File Name not provided' }
  rescue StandardError => e
    { message: e.message }
  end
end
