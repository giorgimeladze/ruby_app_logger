# frozen_string_literal: true

class UriVisitPresenter
  def self.present(uri_string, visits_size)
    printf "%-30s %d \n", uri_string, visits_size
  end
end
