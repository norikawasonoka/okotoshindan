class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id].to_i)
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save
      flash[:notice] = "質問が作成されました"
      redirect_to questions_path
    else
      flash[:alert] = "質問の作成に失敗しました"
      redirect_to questions_path
    end
  end

  def result
    # ここでリダイレクト先の result_id を設定する
    if params[:question_id].to_i == 3
      session[:result_id] = 1
      redirect_to result_questions_path
    elsif
      params[:question_id].to_i == 4
      session[:result_id] = 2
      redirect_to result_questions_path
    elsif
      params[:question_id].to_i == 8
      session[:result_id] = 3
      redirect_to result_questions_path
    elsif
      params[:question_id].to_i == 9
      session[:result_id] = 4
      redirect_to result_questions_path
    elsif
      params[:question_id].to_i == 10
      session[:result_id] = 5
      redirect_to result_questions_path
    elsif
      params[:question_id].to_i == 6
      session[:result_id] = 6
      redirect_to result_questions_path
    elsif
      params[:question_id].to_i == 7
      session[:result_id] = 7
      redirect_to result_questions_path
    else
      flash[:alert] = "質問IDが無効です"
      redirect_to questions_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end
end
