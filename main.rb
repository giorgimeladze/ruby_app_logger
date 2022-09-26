# frozen_string_literal: true

require_relative 'lib/adapters/log_to_hash_adapter'
require_relative 'lib/generators/hash_output_generator'
require_relative 'lib/generators/sorted_hash_generator'

log_file = ARGV[0]
output_hash = LogToHashAdapter.new(log_file).convert_to_hash
HashOutputGenerator.new(output_hash).generate(SortedHashGenerator)
