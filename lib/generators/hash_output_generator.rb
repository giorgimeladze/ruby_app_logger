# frozen_string_literal: true

require_relative 'sorted_hash_generator'
require_relative '../services/uri_hash_statistics'
require_relative '../presenters/uri_visit_presenter'
require_relative '../presenters/uri_output_presenter'

class HashOutputGenerator
  attr_reader :hash, :uri_statistics

  def initialize(hash, uri_statistics = UriHashStatistics)
    @hash = hash
    @uri_statistics = uri_statistics
  end

  def generate(sorting_generator, output_presenter = UriOutputPresenter)
    if hash.key?(:message)
      puts hash[:message]
      return
    end

    output_presenter.present_visits_text
    visits_hash = sorting_generator.generate_visits(hash)
    output_visits_hash_context(visits_hash, uri_statistics.new(visits_hash))

    output_presenter.present_uniq_visits_text
    uniq_visits_hash = sorting_generator.generate_uniq_visits(hash)
    output_uniq_visits_hash_context(uniq_visits_hash, uri_statistics.new(uniq_visits_hash))

    output_presenter.say_goodbye
  end

  private

  def output_visits_hash_context(visits_hash, uri_hash_statistics, visit_presenter = UriVisitPresenter)
    visits_hash.each do |uri, _uri_visits|
      visit_presenter.present("#{uri} visits", uri_hash_statistics.key_visits_size(uri, :visits))
    end
  end

  def output_uniq_visits_hash_context(uniq_visits_hash, uri_hash_statistics, visit_presenter = UriVisitPresenter)
    uniq_visits_hash.each do |uri, _uri_visits|
      visit_presenter.present("#{uri} unique visits", uri_hash_statistics.key_visits_size(uri, :uniq_visits))
    end
  end
end
