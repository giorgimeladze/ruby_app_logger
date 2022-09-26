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
    else
      puts 'Output of most visits on a page'
      sorting_generator.generate_visits(hash)
      puts 'Output of the most uniq visits on  a page'
      sorting_generator.generate_uniq_visits(hash)
      puts 'Thanks for your time'
    end
  end
end
