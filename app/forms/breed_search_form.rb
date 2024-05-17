class BreedSearchForm
  include ActiveModel::Model

  attr_accessor :breed

  validates :breed, presence: true

  def search
    nil if invalid?
  end
end
