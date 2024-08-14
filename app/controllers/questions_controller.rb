class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find_by(id: params[:id])
  end

  def create
    if params[:questions].present?
      first_question = params[:questions][:first_question]
  
      case first_question
      when "ことの音楽"
        if some_condition
          session[:next_question] = "定番"
        elsif another_condition
          session[:next_question] = "定番のアレンジ"
        else
          session[:next_question] = "オリジナル"
        end
  
      when "ポップス"
        if condition
          session[:next_question] = "激しめ"
        else
          session[:next_question] = "きれい"
        end
      end
  
      # Result を見つけるか、新しく作成
      @result = Result.find_or_create_by(title: "Example Result", description: "Description of the example result")
  
      # Question の作成と関連付け
      @question = Question.new(question_params)
      @question.results << @result # 多対多の関連付け
  
      if @question.save
        session[:result_id] = @result.id # 結果IDをセッションに保存
        redirect_to action: "next_question"
      else
        # 保存に失敗した場合、適切なエラーハンドリング
        render :index
      end
    end
  end
  
  
  def next_question
    next_question = session[:next_question]
  
    case next_question
    when "定番"
      # 定番に関する処理
      redirect_to action: "result"
    when "定番のアレンジ"
      # 定番のアレンジに関する処理
      redirect_to action: "result"
    when "オリジナル"
      # オリジナルに関する処理
      if some_condition
        session[:third_question] = "この音とまれ"
      elsif another_condition
        session[:third_question] = "激しめ"
      else
        session[:third_question] = "きれい"
      end
      # `next_question` が "オリジナル" の場合、処理が終わったらリダイレクト
      redirect_to action: "result"
    when "激しめ"
      # 激しめに関する処理
      redirect_to action: "result"
    when "きれい"
      # きれいに関する処理
      redirect_to action: "result"
    end
      # `session[:next_question]` に該当しない場合のデフォルト処理
      redirect_to action: "third_question" # 必要に応じて適切なアクションにリダイレクト
    end
  end

  def third_question
    third_question = session[:third_question]
  
    case third_question
    when "この音とまれ"
      # この音とまれに関する処理
      # ここに具体的な処理を記述する
      redirect_to action: "result"
    when "激しめ"
      # 激しめに関する処理
      # ここに具体的な処理を記述する
      redirect_to action: "result"
    when "きれい"
      # きれいに関する処理
      # ここに具体的な処理を記述する
      redirect_to action: "result"
    end
      # `session[:third_question]` に該当しない場合のデフォルト処理
      # 必要に応じて適切なアクションにリダイレクト
      redirect_to action: "index" # エラーページや適切なアクションを指定する
    end
  end

  def result
    your_result_id = session[:result_id]
    
    if your_result_id
      @your_result = Result.find(your_result_id)
      session.delete(:result_id) # セッションから結果IDを削除
    else
      redirect_to root_path, alert: "結果が見つかりません" # 結果が見つからない場合のエラーメッセージ
    end
  end

private

  def question_params
    params.require(:questions).permit(:id, :question_title) # 必要に応じてフィールドを調整
  end
end
