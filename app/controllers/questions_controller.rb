class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find_by(id: params[:id])
  end

  def create
    if params[:questions].present?
        params[:questions].each do |question_param|
            @question = Question.new(question_param.permit(:question_title))
            if @question.save
                flash[:notice] = "診断が完了しました"
                redirect_to question_path(@questions.id)
            else
                redirect_to action: "index"
                return
            end
        end
        redirect_to action: "index"
    else
        flash[:alert] = "質問が送信されていません"
        redirect_to action: "index"
    end
  end

  def result
    your_result_id = session[:result_id]
    if your_result_id
      @your_result = Result.find(your_result_id)
      session.delete(:result_id) # セッションから結果IDを削除
    else
      redirect_to root_path, alert: "結果が見つかりません" # エラーメッセージ
    end
  end
private

  def question_params
    params.require(:questions).permit(:id, :question_title)
  end
end
