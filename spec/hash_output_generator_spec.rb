# frozen_string_literal: true

require_relative '../hash_output_generator'
require_relative '../sorted_hash_generator'
require 'rspec/autorun'

describe HashOutputGenerator, type: :helper do
  describe '.generate' do
    it 'puts error message' do
      hash = { message: 'error' }
      expect { described_class.new(hash).generate(SortedHashGenerator) }.to output("error\n").to_stdout
    end

    context 'without message key' do
      before(:each) do
        allow(SortedHashGenerator).to receive(:generate_visits).and_return(true)
        allow(SortedHashGenerator).to receive(:generate_uniq_visits).and_return(true)
      end

      it 'puts three outputs in stdout' do
        hash = {}
        expect do
          HashOutputGenerator.new(hash).generate(SortedHashGenerator)
        end.to output(include('Output of most visits on a page', 'Output of the most uniq visits on  a page',
                              'Thanks for your time')).to_stdout
      end
    end
  end
end
