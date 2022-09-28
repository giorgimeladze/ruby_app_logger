# frozen_string_literal: true

require_relative '../../lib/adapters/log_file_adapter'

RSpec.describe LogFileAdapter, type: :helper do
  context 'validations' do
    it 'returns error message for more than two words in line' do
      file_name = 'spec/log_files/webserver_two_word_error.log'
      expect { described_class.new(file_name).output_content }.to raise_error('Two words should be in each line')
    end

    it "returns error message for IPs' having words" do
      file_name = 'spec/log_files/webserver_ip_word_error.log'
      expect { described_class.new(file_name).output_content }.to raise_error("in IP's place word are placed")
    end

    it "returns error message if IP doesn't have three dots" do
      file_name = 'spec/log_files/webserver_not_correct_ip_error.log'
      expect do
        described_class.new(file_name).output_content
      end.to raise_error("in IP's place, three dots should be present for IP to be valid")
    end
  end
end
