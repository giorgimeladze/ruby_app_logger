# frozen_string_literal: true

require_relative 'log_ip_incorrect_error'

class IpContainsLetterError < LogIpIncorrectError
  def message
    "in IP's place word are placed"
  end
end
