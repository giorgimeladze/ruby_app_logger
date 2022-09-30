# frozen_string_literal: true

require_relative 'validator'
require_relative '../errors/path_incorrect_characters_error'
require_relative '../errors/path_slashes_error'

class LogPathValidator < Validator
  def validate(path_word)
    validate_path(path_word)
  end

  private

  def validate_path(path)
    raise PathIncorrectCharactersError if path.count('$%#@!?').positive?
    raise PathSlashesError if path.count('/').zero?
  end
end
