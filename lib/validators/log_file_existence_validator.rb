# frozen_string_literal: true

require_relative 'validator'
require_relative '../errors/log_file_not_found_error'

class LogFileExistenceValidator
  def validate(file_name)
    raise LogFileNotFoundError unless File.exist?(file_name)
  end
end
