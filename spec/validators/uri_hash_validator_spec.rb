# frozen_string_literal: true

require_relative '../../lib/validators/uri_hash_validator'

RSpec.describe UriHashValidator, type: :helper do
  context 'validations' do
    it 'raises error for more than two words in line' do
      line_words = ['/home', '1.1.1.1', 'ok']
      expect { subject.validate_line_words(line_words) }.to raise_error(LogFileWordsCountError)
    end

    it 'raises error for having special characters in path' do
      line_words = ['/hom$e', '1.1.1.1']
      expect { subject.validate_line_words(line_words) }.to raise_error(PathIncorrectCharactersError)
    end

    it 'raises error if no slashes contained in path' do
      line_words = ['home', '1.1.1.1']
      expect { subject.validate_line_words(line_words) }.to raise_error(PathSlashesError)
    end

    it "returns error message for IPs' having words" do
      line_words = ['/home', '1.1.K.1']
      expect { subject.validate_line_words(line_words) }.to raise_error(IpContainsLetterError)
    end

    it "returns error message if IP doesn't have three dots" do
      line_words = ['/home', '126.125.124']
      expect { subject.validate_line_words(line_words) }.to raise_error(IpDotsError)
    end
  end
end
