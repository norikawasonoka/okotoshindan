class DiagnosesController < ApplicationController
  def index
    @diagnosis = Diagnosis.all
  end

  def new
    @diagnosis = Diagnosis.new
  end

  def show
    @diagnosis = Diagnosis.find_by(id: params[:id])
    
    case @diagnosis.id
    when 3
      @result = Result.find(1)
    when 4
      @result = Result.find(2)
    when 8
      @result = Result.find(3)
    when 9
      @result = Result.find(4)
    when 10
      @result = Result.find(5)
    when 6
      @result = Result.find(6)
    when 7
      @result = Result.find(7)
    else
      @result = nil # 他のidの場合はnilなどを設定しておく
    end
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
  #params[:topic][:question] ? @topic.question = params[:topic][:question].join("") : false
    if @diagnosis.save
        flash[:notice] = "診断が完了しました"
        redirect_to diagnosis_path(@diagnosis.id)
    else
        redirect_to :action => "new"
    end
  end

private
  def diagnosis_params
      params.require(:diagnosis).permit(:title)
  end
end
