# frozen_string_literal: true

require_relative '../../lib/services/log_file_processor'
require 'rspec/autorun'

describe LogFileProcessor, type: :helper do
  describe '.line_words_array' do
    let!(:array) { [['/home', '1.1.1.1']] }

    it 'returns a hash' do
      response = subject.convert_to_hash(array)
      expect(response).to be_instance_of Hash
    end

    it 'contains path and ip in array' do
      response = subject.convert_to_hash(array)
      expect(response.key?('/home')).to be true
      expect(response['/home'][:visits]).to eq(['1.1.1.1'])
      expect(response['/home'][:uniq_visits]).to eq(Set.new(['1.1.1.1']))
    end
  end
end
