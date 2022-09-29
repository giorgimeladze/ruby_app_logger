# frozen_string_literal: true

class LogFileProcessor
  def convert_to_hash(read_file_output)
    uri_path_visit_info = {}
    read_file_output.each do |line_words|
      unless uri_path_visit_info.key?(line_words[0])
        uri_path_visit_info[line_words[0]] = { uniq_visits: Set.new, visits: [] }
      end
      uri_path_visit_info[line_words[0]][:uniq_visits] << line_words[1]
      uri_path_visit_info[line_words[0]][:visits] << line_words[1]
    end

    uri_path_visit_info
  end
end
