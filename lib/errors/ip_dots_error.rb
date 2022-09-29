# frozen_string_literal: true

require_relative 'log_ip_incorrect_error'

class IpDotsError < LogIpIncorrectError
  def message
    "in IP's place, three dots should be present for IP to be valid"
  end
end
