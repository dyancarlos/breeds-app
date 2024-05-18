class BreedSearchForm
  include ActiveModel::Model

  attr_accessor :query

  validates :query, presence: true

  def search
    Breeds::SearchApiService.new(query: normalized_query).call
  end

  private

  def normalized_query
    query.downcase
  end
end
