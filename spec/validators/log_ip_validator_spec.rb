# frozen_string_literal: true

require_relative '../../lib/validators/log_ip_validator'

RSpec.describe LogIpValidator, type: :helper do
  context 'validations' do
    it "returns error message for IPs' having words" do
      expect { subject.validate('1.1.K.1') }.to raise_error(IpContainsLetterError)
    end

    it "returns error message if IP doesn't have three dots" do
      expect { subject.validate('126.125.124') }.to raise_error(IpDotsError)
    end
  end
end
