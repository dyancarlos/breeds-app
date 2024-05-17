class BreedSearchesController < ApplicationController
  def show
    @form = BreedSearchForm.new(search_params)

    return if @form.search

    render :new
  end

  def new
    @form = BreedSearchForm.new
  end

  private

  def search_params
    params.require(:breed_search_form).permit(:breed)
  end
end
