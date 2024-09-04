# frozen_string_literal: true

# Represents the controller for Results.
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
    @youtube_embed_codes = fetch_youtube_embed_codes(@result.id)
  end

  def create
    @diagnosis = Diagnosis.find(params[:diagnosis_id])
    @result = @diagnosis.build_result(result_params)

    if @result.save
      flash[:notice] = '結果が保存されました'
      redirect_to result_path(@result.id)
    else
      render :new
    end
  end

  private

  def result_params
    params.require(:result).permit(:title)
  end

  def fetch_youtube_embed_codes(result_id)
    youtube_embed_codes = []

    case result_id
    when 1
      youtube_embed_codes << {
        title: '『六段の調』',
        description: '箏を弾くなら避けられない曲',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/WiMo8F6rKA8?"#{' '}
          title="頭上からの視点で『六段の調』iPhoneXSでの撮影"#{' '}
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: '「春の海」',
        description: 'お正月の曲です',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/M0qM5zrWock?"#{' '}
          title=title="春の海（三橋貴風・沢井忠夫）／Haru no Umi（Spring Sea）"#{' '}
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: '「さくらさくら」',
        description: '誰もが知っている曲、春になるとスーパーでよく聞きますね',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/TgMC-AKTXLQ?"#{' '}
          title="おことで「さくらさくら」を弾いてみよう！"#{' '}
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    when 2
      youtube_embed_codes << {
        title: '「春の海幻想」',
        description: 'お正月に聞く曲のアレンジ版、聞いたことあるフレーズが出てきます！',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/kQrFZ8e1E0g?"#{' '}
          title="「春の海幻想」 【加東邦楽演奏会2021】"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: '「筝曲 「さくら」箏独奏による主題と六つの変奏」',
        description: 'あの穏やかな曲がこんな激しくなるとはびっくりします！最後まで聞いてみてください',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/3wvQk57vwHY?#{' '}
          title="筝曲 「さくら」箏独奏による主題と六つの変奏木村園代 Japanese koto"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    when 3
      youtube_embed_codes << {
        title: 'この音とまれ! / 「天泣」',
        description: 'アニメではこのシーン号泣しました。今練習していますが激ムズです。',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/YmGTJ6SGeUU"#{' '}
          title="【箏曲部】この音とまれ! / 天泣 プロ奏者が弾いてみた！"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: 'この音とまれ! /「龍星群」',
        description: '音楽は１分４０秒ごろから始まります。高校生の時文化先で弾いたのを思い出します。',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/Y_Db88Ef6FQ" #{' '}
          title="この音とまれ! 作中オリジナル楽曲「龍星群」"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: 'この音とまれ! /「久遠」',
        description: '作中で初めてコンクールで弾いた曲です。本番までの道のりは青春がつまってます！！',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/yegQRUhJkuM" #{' '}
          title="この音とまれ! 作中オリジナル楽曲「久遠」"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    when 4
      youtube_embed_codes << {
        title: '「二つの群の為に」',
        description: '最初から衝撃です',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/JhMK0Awbiuk?"#{' '}
          title="二つの群の為に (沢井忠夫作曲) ／FUTATSU NO GUN NO TAME NI(by Sawai,Tadao)"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: '箏独奏曲「線香花火」',
        description: '宮城道雄作曲',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/2gQzPktFU5A?"#{' '}
          title="箏独奏曲「線香花火」宮城道雄作曲"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: '【箏三重奏】翊－あくるひ－',
        description: '作曲：橋本みぎわ、この音とまれ！の曲を作曲している方です',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/-_jqps7Yd6Q?"#{' '}
          title="【箏三重奏】翊－あくるひ－（作曲：橋本みぎわ）"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    when 5
      youtube_embed_codes << {
        title: '「絵てがみ」',
        description: '個人的なことになりますが10月の演奏会で弾く曲です',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/9h-WLGVXzEo?"#{' '}
          title="『絵てがみ』Etegami"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: '「遊郭」',
        description: '遊郭を創造しながら聞くと悲しい気分になってきます。時代の厳しさを物語っています',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/VXdFX8ON2bQ?#{' '}
          title="『遊郭』Yuukaku"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    when 6
      youtube_embed_codes << {
        title: '「紅蓮華 」',
        description: 'アニメ「鬼滅の刃」op です',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/reCGcMYN9-U?"#{' '}
          title="#鬼滅の刃 #箏 #紅蓮華 【練習風景２２】アニメ「鬼滅の刃」OP紅蓮華（和楽器一人３重奏）"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: '「千本桜 」箏独奏',
        description: '手の動きに注目！',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/01v4fttX8sM?"#{' '}
          title="千本桜 箏独奏 Senbonzakura on Koto solo"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    when 7
      youtube_embed_codes << {
        title: '箏三重奏「炎」',
        description: '鬼滅の刃',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/IpB6Vck3kQY?"#{' '}
          title="箏三重奏「炎」 KOTO trio plays &quot;HOMURA&quot; from Demon Slayer: Kimetsu no Yaiba"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
      youtube_embed_codes << {
        title: '「人生のメリーゴーランド」（ハウルの動く城）',
        description: '高校生の時先輩方がこの曲を弾いていてきれいだなと思い筝曲部に入部するきっかけになった曲です',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/LczZznH1yLY?"#{' '}
          title="【多重演奏】お琴で「人生のメリーゴーランド」／映画「ハウルの動く城」より"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    else
      youtube_embed_codes = nil
    end

    youtube_embed_codes
  end
end
