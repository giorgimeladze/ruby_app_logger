# frozen_string_literal: true

require_relative '../errors/log_file_not_provided_error'
require_relative '../errors/log_file_not_found_error'

class LogFileValidator
  def validate_file_name(file_name)
    raise LogFileNotProvidedError unless file_name.include?('.log')
  end

  def validate_file_existance(file_name)
    raise LogFileNotFoundError unless File.exist?(file_name)
  end
end
