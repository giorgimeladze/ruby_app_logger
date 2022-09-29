# frozen_string_literal: true

class LogFileNotProvidedError < StandardError
  def message
    'Log File was not provided'
  end
end
