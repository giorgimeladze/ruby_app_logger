# frozen_string_literal: true

require_relative '../../lib/adapters/log_to_hash_adapter'

RSpec.describe LogToHashAdapter, type: :helper do
  describe '.convert_to_hash' do
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
