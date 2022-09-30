# frozen_string_literal: true

require_relative 'validator'
require_relative '../errors/ip_contains_letter_error'
require_relative '../errors/ip_dots_error'

class LogIpValidator < Validator
  def validate(ip_word)
    validate_ip(ip_word)
  end

  private

  def validate_ip(ip)
    raise IpContainsLetterError if ip.count('a-zA-Z').positive?
    raise IpDotsError if ip.count('.') != 3
  end
end
