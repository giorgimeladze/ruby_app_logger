# frozen_string_literal: true

require_relative '../../lib/validators/log_path_validator'

RSpec.describe LogPathValidator, type: :helper do
  context 'validations' do

    it 'raises error if no slashes contained in path' do
      expect { subject.validate('home') }.to raise_error(PathSlashesError)
    end

    it 'raises error for having special characters in path' do
      expect { subject.validate('/hom$e') }.to raise_error(PathIncorrectCharactersError)
    end
  end
end
