class BreedSearchForm
  include ActiveModel::Model

  attr_accessor :query

  validates :query, presence: true

  def search
    Breeds::SearchApiService.new(query: query).call
  end
end
