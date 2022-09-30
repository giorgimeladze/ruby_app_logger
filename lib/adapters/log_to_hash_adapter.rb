# frozen_string_literal: true

require 'set'
require_relative '../validators/log_file_name_validator'
require_relative '../validators/log_file_existence_validator'
require_relative 'log_file_adapter'

class LogToHashAdapter
  attr_reader :file_name, :name_validator, :file_existence_validator, :file_adapter

  def initialize(file_name, name_validator = LogFileNameValidator, file_existence_validator = LogFileExistenceValidator, file_adapter = LogFileAdapter)
    @file_name = file_name
    @name_validator = name_validator.new
    @file_existence_validator = file_existence_validator.new
    @file_adapter = file_adapter.new(file_name)
  end

  def convert_to_hash
    name_validator.validate(file_name)
    file_existence_validator.validate(file_name)

    file_adapter.output_content
  rescue StandardError => e
    { message: e.message }
  end
end
