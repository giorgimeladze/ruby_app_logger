# frozen_string_literal: true

require 'set'
require_relative '../validators/uri_hash_validator'

class LogToHashAdapter
  attr_reader :file_name, :hash_validator
  def initialize(file_name, hash_validator = UriHashValidator)
    @file_name = file_name
    @hash_validator = hash_validator.new
  end

  def convert_to_hash
    hash_validator.validate_file_name(file_name)

    uri_path_visit_info = {}
    File.readlines(@file_name.to_s).each do |line|
      line_words = line.split
      hash_validator.validate_line_words(line_words)

      unless uri_path_visit_info.key?(line_words[0])
        uri_path_visit_info[line_words[0]] = { uniq_visits: Set.new, visits: [] }
      end
      uri_path_visit_info[line_words[0]][:uniq_visits] << line_words[1]
      uri_path_visit_info[line_words[0]][:visits] << line_words[1]
    end
    uri_path_visit_info
  rescue Errno::ENOENT
    { message: 'Correct Log File Name not provided' }
  rescue StandardError => e
    { message: e.message }
  end
end
