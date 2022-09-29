# frozen_string_literal: true

require_relative 'log_path_incorrect_error'

class PathSlashesError < LogPathIncorrectError
  def message
    'No slashes present in the path'
  end
end
