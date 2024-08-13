class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find_by(id: params[:id])
  end

  def create
    if params[:questions].present?
      # 最初の質問に対する処理
      case params[:questions][:first_question]
      when "ことの音楽"
        session[:next_question] = "定番" # 次の質問を「定番」に設定
        flash[:notice] = "次の質問は「定番」です。"
        redirect_to action: "next_question" # 次の質問へリダイレクト
      else
        flash[:alert] = "無効な選択です"
        redirect_to action: "index"
      end
    else
      flash[:alert] = "質問が送信されていません"
      redirect_to action: "index"
    end
  end
  
  def next_question
    # セッションから次の質問を取得
    next_question = session[:next_question]
  
    case next_question
    when "定番"
      # 定番に関する処理
      # ここで「ことの音楽→定番」を実装
      session[:next_question] = "定番のアレンジ" # 次の質問を設定
      flash[:notice] = "次の質問は「定番のアレンジ」です。"
      redirect_to action: "next_question"
    when "定番のアレンジ"
      # 定番のアレンジに関する処理
      # ここで「ことの音楽→定番のアレンジ」を実装
      session[:next_question] = "オリジナル" # 次の質問を設定
      flash[:notice] = "次の質問は「オリジナル」です。"
      redirect_to action: "next_question"
    when "オリジナル"
      # オリジナルに関する処理
      # ここで「ことの音楽→オリジナル」を実装
      session[:next_question] = "激しめ" # 次の質問を設定
      flash[:notice] = "次の質問は「激しめ」です。"
      redirect_to action: "next_question"
    when "激しめ"
      # 激しめに関する処理
      # ここで「ことの音楽→オリジナル→激しめ」を実装
      session[:next_question] = "きれい" # 次の質問を設定
      flash[:notice] = "次の質問は「きれい」です。"
      redirect_to action: "next_question"
    when "きれい"
      # きれいに関する処理
      # ここで「ことの音楽→きれい」を実装
      flash[:notice] = "診断が完了しました"
      redirect_to action: "result" # 結果ページへリダイレクト
    else
      flash[:alert] = "無効な選択です"
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
