# frozen_string_literal: true

class SortedHashGenerator
  def self.generate_visits(hash)
    array = hash.sort_by { |_key, value| -value[:visits].size }
    array.each do |uri, uri_value|
      printf "%-30s %d \n", "#{uri} visits", uri_value[:visits].size
    end

    array.to_h
  end

  def self.generate_uniq_visits(hash)
    array = hash.sort_by { |_key, value| -value[:uniq_visits].size }
    array.each do |uri, uri_value|
      printf "%-30s %d \n", "#{uri} unique visits", uri_value[:uniq_visits].size
    end

    array.to_h
  end
end
