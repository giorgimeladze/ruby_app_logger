# frozen_string_literal: true

class UriHashStatistics
  attr_reader :uri_hash

  def initialize(uri_hash)
    @uri_hash = uri_hash
  end

  def key_visits_size(key, symbol)
    uri_hash[key][symbol].size
  end
end
