# frozen_string_literal: true

require_relative '../../lib/validators/log_file_validator'

RSpec.describe LogFileValidator, type: :helper do
  context 'validations' do
    it 'raises error if file not log file' do
      file_name = 'spec/log_files/webserver_test.txt'
      expect { subject.validate_file_name(file_name) }.to raise_error(LogFileNotProvidedError)
    end

    it 'raises error if log file not found' do
      file_name = 'spec/log_files/webserverr_test.log'
      expect { subject.validate_file_existance(file_name) }.to raise_error(LogFileNotFoundError)
    end
  end
end
