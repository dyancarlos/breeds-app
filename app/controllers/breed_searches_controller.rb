class BreedSearchesController < ApplicationController
  def show
    @form = BreedSearchForm.new(search_params)

    if @form.valid?
      @response = @form.search
    else
      render :error
    end
  rescue Breeds::SearchApiError => e
    @message = e
    render :error
  end

  def new
    @form = BreedSearchForm.new
  end

  private

  def search_params
    params.require(:breed_search_form).permit(:query)
  end
end
