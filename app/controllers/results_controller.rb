class ResultsController < ApplicationController
  def index
  end

  def show
    @result = Result.find(:id)
    @diagnosis = @result.diagnosis
  end
end
