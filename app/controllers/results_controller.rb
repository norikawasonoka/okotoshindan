class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def show
    @result = Result.find_by(id: params[:id])
    @diagnosis = @result.diagnosis
  end

  def create
    @diagnosis = Diagnosis.find(params[:diagnosis_id])
    @result = @diagnosis.build_result(result_params)

    if @result.save
      flash[:notice] = "結果が保存されました"
      redirect_to result_path(@result.id)
    else
      render :new
    end
  end

  private

  def result_params
    params.require(:result).permit(:title)
  end
end
