# frozen_string_literal: true

require_relative 'sorted_hash_generator'

class HashOutputGenerator
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def generate(sorting_generator)
    if hash.key?(:message)
      puts hash[:message]
      return
    end

    puts 'Output of most visits on a page'
    visits_hash = sorting_generator.generate_visits(hash)
    output_visits_hash_context(visits_hash)

    puts 'Output of the most uniq visits on  a page'
    uniq_visits_hash = sorting_generator.generate_uniq_visits(hash)
    output_uniq_visits_hash_context(uniq_visits_hash)

    puts 'Thanks for your time'
  end

  private

  def output_visits_hash_context(visits_hash)
    visits_hash.each do |uri, uri_value|
      printf "%-30s %d \n", "#{uri} visits", uri_value[:visits].size
    end
  end

  def output_uniq_visits_hash_context(uniq_visits_hash)
    uniq_visits_hash.each do |uri, uri_value|
      printf "%-30s %d \n", "#{uri} unique visits", uri_value[:uniq_visits].size
    end
  end
end
