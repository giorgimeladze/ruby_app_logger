# frozen_string_literal: true

require_relative '../../lib/adapters/log_to_hash_adapter'

RSpec.describe LogToHashAdapter, type: :helper do
  describe '.convert_to_hash' do
    context 'validations' do
      it 'returns error message for not log file' do
        file_name = 'webserver.txt'
        response = described_class.new(file_name).convert_to_hash
        expect(response[:message]).to eq('Log File was not provided')
      end

      it 'throws error message for file not found' do
        file_name = 'webserverserverr.log'
        response = described_class.new(file_name).convert_to_hash
        expect(response[:message]).to eq('Correct Log File Name not provided')
      end

      it 'returns error message for more than two words in line' do
        file_name = 'spec/log_files/webserver_two_word_error.log'
        response = described_class.new(file_name).convert_to_hash
        expect(response[:message]).to eq('Two words should be in each line')
      end

      it "returns error message for IPs' having words" do
        file_name = 'spec/log_files/webserver_ip_word_error.log'
        response = described_class.new(file_name).convert_to_hash
        expect(response[:message]).to eq("in IP's place word are placed")
      end

      it "returns error message if IP doesn't have three dots" do
        file_name = 'spec/log_files/webserver_not_correct_ip_error.log'
        response = described_class.new(file_name).convert_to_hash
        expect(response[:message]).to eq("in IP's place, three dots should be present for IP to be valid")
      end
    end

    context 'returned hash' do
      subject { described_class.new('spec/log_files/webserver_test.log') }

      it 'counts just visits' do
        responsed_hash = subject.convert_to_hash
        expect(responsed_hash.keys).to eq(['/home', '/about'])
        expect(responsed_hash['/home'][:visits].size).to eq(4)
        expect(responsed_hash['/about'][:visits].size).to eq(5)
      end

      it 'counts uniq visits' do
        responsed_hash = subject.convert_to_hash
        expect(responsed_hash.keys).to eq(['/home', '/about'])
        expect(responsed_hash['/home'][:uniq_visits]).to eq(Set.new(['1.1.1.1', '2.2.2.2']))
        expect(responsed_hash['/about'][:uniq_visits]).to eq(Set.new(['1.2.3.4', '2.3.4.5', '3.3.3.1', '4.4.4.4']))
      end
    end
  end
end
