# frozen_string_literal: true

require_relative '../../lib/generators/sorted_hash_generator'
require 'rspec/autorun'

describe SortedHashGenerator, type: :helper do
  describe '#generate_visits' do
    let!(:hash) do
      {
        '/about' => { visits: [1, 1, 4, 6, 7] },
        '/home' => { visits: [1, 1, 2, 3, 3, 4, 5, 6] }
      }
    end

    it 'prints output twice to printf' do
      expect do
        described_class.generate_visits(hash)
      end.to output(include('/home', hash['/home'][:visits].size.to_s)).to_stdout
    end

    it 'sorts hash in descending order' do
      new_hash = described_class.generate_visits(hash)
      array = hash.sort_by { |_key, value| -value[:visits].size }
      expect(new_hash).to eq(array.to_h)
    end
  end

  describe '#generate_uniq_visits' do
    let!(:hash) do
      {
        '/about' => { uniq_visits: [1, 4, 6, 7] },
        '/home' => { uniq_visits: [1, 2, 3, 3, 4, 5, 6] }
      }
    end

    it 'prints output twice to printf' do
      expect do
        described_class.generate_uniq_visits(hash)
      end.to output(include('/home', hash['/home'][:uniq_visits].size.to_s, '/about', 'unique')).to_stdout
    end

    it 'sorts hash in descending order' do
      new_hash = described_class.generate_uniq_visits(hash)
      array = hash.sort_by { |_key, value| -value[:uniq_visits].size }
      expect(new_hash).to eq(array.to_h)
    end
  end
end
