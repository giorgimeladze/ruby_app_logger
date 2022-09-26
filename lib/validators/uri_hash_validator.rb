# frozen_string_literal: true

class UriHashValidator
  def validate_file_name(file_name)
    raise 'Log File was not provided' unless file_name.include?('.log')
  end

  def validate_line_words(line_words)
    raise 'Two words should be in each line' if line_words.size != 2
    raise "in IP's place word are placed" if line_words[1].count('a-zA-Z').positive?
    raise "in IP's place, three dots should be present for IP to be valid" if line_words[1].count('.') != 3
  end
end
