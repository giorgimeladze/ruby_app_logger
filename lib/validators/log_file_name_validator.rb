# frozen_string_literal: true

require_relative 'validator'
require_relative '../errors/log_file_not_provided_error'

class LogFileNameValidator < Validator
  def validate(file_name)
    raise LogFileNotProvidedError unless file_name.include?('.log')
  end
end
