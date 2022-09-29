# frozen_string_literal: true

require_relative 'log_path_incorrect_error'

class PathIncorrectCharactersError < LogPathIncorrectError
  def message
    'URI path contains incorrect characters'
  end
end
