# frozen_string_literal: true

require 'set'

class LogToHashAdapter
  def initialize(file_name)
    @file_name = file_name
  end

  def convert_to_hash
    validate_file_name
    uri_path_visit_info = {}
    File.readlines(@file_name.to_s).each do |line|
      line_words = line.split
      validate_each_line(line_words)
      if uri_path_visit_info.key?(line_words[0])
      else
        uri_path_visit_info[line_words[0]] = { uniq_visits: Set.new, visits: [] }
      end
      uri_path_visit_info[line_words[0]][:uniq_visits] << line_words[1]
      uri_path_visit_info[line_words[0]][:visits] << line_words[1]
    end
    uri_path_visit_info
  rescue Errno::ENOENT => e
    puts e
    { message: 'Correct Log File Name not provided' }
  rescue StandardError => e
    { message: e.message }
  end

  private

  def validate_file_name
    raise 'Log File was not provided' unless @file_name.include?('.log')
  end

  def validate_each_line(line_words)
    raise 'Two words should be in each line' if line_words.size != 2
    raise "in IP's place word are placed" if line_words[1].count('a-zA-Z').positive?
    raise "in IP's place, three dots should be present for IP to be valid" if line_words[1].count('.') != 3
  end
end
