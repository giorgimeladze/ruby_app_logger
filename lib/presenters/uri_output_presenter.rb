# frozen_string_literal: true

class UriOutputPresenter
  def self.present_error(message)
    puts message
  end

  def self.present_visits_text
    puts 'Output of most visits on a page'
  end

  def self.present_uniq_visits_text
    puts 'Output of the most uniq visits on  a page'
  end

  def self.say_goodbye
    puts 'Thanks for your time'
  end
end
