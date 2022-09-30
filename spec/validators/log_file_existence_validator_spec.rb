# frozen_string_literal: true

require_relative '../../lib/validators/log_file_existence_validator'

RSpec.describe LogFileExistenceValidator, type: :helper do
  context 'validations' do
    it 'raises error if log file not found' do
      file_name = 'spec/log_files/webserverr_test.log'
      expect { subject.validate(file_name) }.to raise_error(LogFileNotFoundError)
    end
  end
end
