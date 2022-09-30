# frozen_string_literal: true

require_relative '../../lib/services/log_file_reader'
require_relative '../../lib/validators/log_ip_validator'
require_relative '../../lib/validators/log_path_validator'
require_relative '../../lib/validators/log_words_validator'
require 'rspec/autorun'

describe LogFileReader, type: :helper do
  describe '.line_words_array' do
    let!(:file_name) { 'spec/log_files/webserver_test.log' }
    before(:each) do
      allow_any_instance_of(LogIpValidator).to receive(:validate).and_return(true)
      allow_any_instance_of(LogPathValidator).to receive(:validate).and_return(true)
      allow_any_instance_of(LogWordsValidator).to receive(:validate).and_return(true)
    end
    subject { described_class.new(file_name, LogIpValidator.new, LogPathValidator.new, LogWordsValidator.new) }

    it 'returns an array' do
      response = subject.line_words_array
      expect(response).to be_instance_of Array
    end

    it 'contains path and ip in array' do
      response = subject.line_words_array
      expect(response.first.size).to eq(2)
      expect(response.last.size).to eq(2)
      expect(response.first.first).to eq('/home')
      expect(response.first.last).to eq('1.1.1.1')
    end
  end
end
