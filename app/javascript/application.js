// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

// ここから新しいコードを追加 他のページからトップページに戻ってもラインのボタンが再生成
document.addEventListener("turbo:load", function() {
    var buttonContainer = document.getElementById('line-button-container');
    if (buttonContainer) {
      buttonContainer.innerHTML = '<div class="line-it-button" data-lang="ja" data-type="friend" data-env="REAL" data-lineId="@501hrlmq" style="display: block;"></div>';
      // LINEボタンの再生成
      if (typeof LineIt !== 'undefined') {
        LineIt.loadButton();
      }
    }
  });
  