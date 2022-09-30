# frozen_string_literal: true

require_relative '../../lib/validators/log_file_name_validator'

RSpec.describe LogFileNameValidator, type: :helper do
  context 'validations' do
    it 'raises error if file not log file' do
      file_name = 'spec/log_files/webserver_test.txt'
      expect { subject.validate(file_name) }.to raise_error(LogFileNotProvidedError)
    end
  end
end
