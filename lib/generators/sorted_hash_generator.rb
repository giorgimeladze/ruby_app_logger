# frozen_string_literal: true

class SortedHashGenerator
  def self.generate_visits(hash)
    array = hash.sort_by { |_key, value| -value[:visits].size }
    array.to_h
  end

  def self.generate_uniq_visits(hash)
    array = hash.sort_by { |_key, value| -value[:uniq_visits].size }
    array.to_h
  end
end
