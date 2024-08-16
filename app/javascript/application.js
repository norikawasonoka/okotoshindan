// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("DOMContentLoaded", () => {
    let currentQuestion = 1;
    // 質問が入っているコンテナ（または質問のリスト）を取得
    const questions = document.querySelectorAll('.question');

    // 質問の数をtotalQuestionsに格納
    const totalQuestions = questions.length;

    console.log(`Total questions: ${totalQuestions}`);
  
    // 各質問ごとに次の質問を決定するロジック
    const nextQuestions = {
      "定番": "定番のアレンジ",
      "オリジナル": ["この音とまれ", "激しい曲", "きれいな曲"],
      "アップテンポ": null, // 最後の質問なので次はなし
      "スローテンポ": null  // 最後の質問なので次はなし
    };  
  
    const startButton = document.getElementById('start-questions');
    const startDescription = document.getElementById('start-description');
  //診断の説明を非表示にする
  startButton.addEventListener('click', () => {
    startButton.classList.add('hidden');
    startDescription.classList.add('hidden');

    // 初めの質問を表示
    document.getElementById(`question_${currentQuestion}`).classList.remove('hidden');
    updateButtonVisibility();
  });

  // ボタンの表示を更新する関数
  function updateButtonVisibility() {
    document.getElementById(`next_button`).classList.toggle('hidden', currentQuestion >= 10);  // 質問10の場合、次へボタンを非表示に
    document.getElementById(`previous_button`).classList.toggle('hidden', currentQuestion <= 1);  // 質問1の場合、戻るボタンを非表示に
    document.getElementById(`submit-button`).classList.toggle('hidden', currentQuestion !== 10);  // 質問10以外の場合、結果ボタンを非表示に
  }

  // ラジオボタンがチェックされたときのイベントリスナーをすべてのラジオボタンに設定
  document.querySelectorAll('input[type="radio"]').forEach(radio => {
    radio.addEventListener('change', (event) => {
      highlightSelectedOption(event.target);
    });
  });

  function highlightSelectedOption(selectedRadio) {
    // すべてのラベルから背景色クラス（青色）を削除
    document.querySelectorAll(`label`).forEach(label => {
      label.classList.remove('bg-white'); // 青色の背景色を削除
      label.classList.add('bg-customGreen6'); // 緑色の背景色を追加
    });

    // 選択されたラベルの背景色を変更
    const selectedLabel = document.querySelector(`label[for="${selectedRadio.id}"]`);
    if (selectedLabel) {
      selectedLabel.classList.remove('bg-customGreen6'); // 緑色の背景色を削除
      selectedLabel.classList.add('bg-white'); // 'bg-highlight' は選択されたときの背景色を設定するクラス名
    }
  }


  //次へボタンのクリック処理
  document.addEventListener('click', (event) => {

    if (event.target.dataset.action === 'next-question'){
      // 現在の質問で選択されている選択肢を取得
      const selectedAnswer = document.querySelector(`input[data-question-id="${currentQuestion}"]:checked`);

      if (!selectedAnswer) {
        // 選択されていない場合はエラーメッセージを表示して処理を終了
        document.getElementById(`error_message`).classList.remove('hidden');
        return;
      } else {
        // 選択されている場合は、エラーメッセージが表示されている場合は隠す
        document.getElementById(`error_message`).classList.add('hidden');
      }

      document.getElementById(`question_${currentQuestion}`).classList.add('hidden');
      currentQuestion++;
      document.getElementById(`question_${currentQuestion}`).classList.remove('hidden');
      const selectedRadio = document.querySelector(`input[data-question-id="${currentQuestion}"]:checked`);
      if (selectedRadio) {
        highlightSelectedOption(selectedRadio);
      }
      updateButtonVisibility();
    } else if (event.target.dataset.action === 'previous-question') {
      document.getElementById(`question_${currentQuestion}`).classList.add('hidden');
      currentQuestion--;
      document.getElementById(`question_${currentQuestion}`).classList.remove('hidden');
      const selectedRadio = document.querySelector(`input[data-question-id="${currentQuestion}"]:checked`);
      if (selectedRadio) {
        highlightSelectedOption(selectedRadio);
      }
      updateButtonVisibility();
    }

    if (event.target.id === 'submit-button') {
      const lastQuestionAnswerSelected = document.querySelector(`input[data-question-id="10"]:checked`);

      if (!lastQuestionAnswerSelected) {
          // エラーメッセージを表示する
          document.getElementById(`error_message`).classList.remove('hidden');
          event.preventDefault();
          return;
      } else {
          document.getElementById(`error_message`).classList.add('hidden');
      }
    }
  });

});
