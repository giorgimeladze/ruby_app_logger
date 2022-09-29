# frozen_string_literal: true

require 'set'
require_relative '../validators/log_file_validator'
require_relative 'log_file_adapter'

class LogToHashAdapter
  attr_reader :file_name, :log_file_validator, :file_adapter

  def initialize(file_name, log_file_validator = LogFileValidator, file_adapter = LogFileAdapter)
    @file_name = file_name
    @log_file_validator = log_file_validator.new
    @file_adapter = file_adapter.new(file_name)
  end

  def convert_to_hash
    log_file_validator.validate_file_name(file_name)
    log_file_validator.validate_file_existance(file_name)

    file_adapter.output_content
  rescue StandardError => e
    { message: e.message }
  end
end
