# frozen_string_literal: true

require_relative '../errors/path_incorrect_characters_error'
require_relative '../errors/path_slashes_error'
require_relative '../errors/log_file_words_count_error'
require_relative '../errors/ip_contains_letter_error'
require_relative '../errors/ip_dots_error'

class UriHashValidator
  def validate_line_words(line_words)
    validate_words(line_words)
    validate_path(line_words[0])
    validate_ip(line_words[1])
  end

  private

  def validate_words(line_words)
    raise LogFileWordsCountError if line_words.size != 2
  end

  def validate_path(path)
    raise PathIncorrectCharactersError if path.count('$%#@!?').positive?
    raise PathSlashesError if path.count('/').zero?
  end

  def validate_ip(ip)
    raise IpContainsLetterError if ip.count('a-zA-Z').positive?
    raise IpDotsError if ip.count('.') != 3
  end
end
