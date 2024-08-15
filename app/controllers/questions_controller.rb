class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def calculate
    answers = calculate_params.values
    total_score = 0
  
    answers.each do |answer|
      question_type, answer_value = answer.split("→") # 例えば "ことの曲→定番" の形式を想定している場合
      if SCORES[question_type.to_sym] && SCORES[question_type.to_sym][answer_value]
        total_score += SCORES[question_type.to_sym][answer_value]
      end
    end
  
    session[:total_score] = total_score
    redirect_to result_questions_path
  end  

  def result
    @total_score = session[:total_score]
    if @total_score
      @result = Result.find_by('score_range_start <= ? AND score_range_end >= ?', @total_score, @total_score)
      session.delete(:total_score)
    else
      redirect_to root_path, danger: t('.fail')
    end
  end

  private

  def calculate_params
    params.require(:calculate).permit(:answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6, :answer_7)
  end
  #受け取る回答の数が固定されているので、柔軟性を持たせるために、params[:calculate].permit!
end
