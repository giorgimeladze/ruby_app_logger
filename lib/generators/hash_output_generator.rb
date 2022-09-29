# frozen_string_literal: true

require_relative 'sorted_hash_generator'
require_relative '../services/uri_hash_statistics'

class HashOutputGenerator
  attr_reader :hash, :uri_statistics

  def initialize(hash, uri_statistics = UriHashStatistics)
    @hash = hash
    @uri_statistics = uri_statistics
  end

  def generate(sorting_generator)
    if hash.key?(:message)
      puts hash[:message]
      return
    end

    puts 'Output of most visits on a page'
    visits_hash = sorting_generator.generate_visits(hash)
    output_visits_hash_context(visits_hash, uri_statistics.new(visits_hash))

    puts 'Output of the most uniq visits on  a page'
    uniq_visits_hash = sorting_generator.generate_uniq_visits(hash)
    output_uniq_visits_hash_context(uniq_visits_hash, uri_statistics.new(uniq_visits_hash))

    puts 'Thanks for your time'
  end

  private

  def output_visits_hash_context(visits_hash, uri_hash_statistics)
    visits_hash.each do |uri, _uri_visits|
      printf "%-30s %d \n", "#{uri} visits", uri_hash_statistics.key_visits_size(uri, :visits)
    end
  end

  def output_uniq_visits_hash_context(uniq_visits_hash, uri_hash_statistics)
    uniq_visits_hash.each do |uri, _uri_visits|
      printf "%-30s %d \n", "#{uri} unique visits", uri_hash_statistics.key_visits_size(uri, :uniq_visits)
    end
  end
end
