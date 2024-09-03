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
        title: '【箏曲部】この音とまれ! / 天泣',
        description: 'アニメではこのシーン号泣しました',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/YmGTJ6SGeUU"#{' '}
          title="【箏曲部】この音とまれ! / 天泣 プロ奏者が弾いてみた！"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    when 4
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
        title: '箏独奏曲「線香花火」',
        description: '宮城道雄作曲 この作曲者は盲目の方です',
        embed_code: <<-HTML
          <iframe src="https://www.youtube.com/embed/YmGTJ6SGeUU"#{' '}
          title="【箏曲部】この音とまれ! / 天泣 プロ奏者が弾いてみた！(konoototomare , tenkyu , anime)"#{' '}
          frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"#{' '}
          referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>
        HTML
      }
    when 6
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
    else
      youtube_embed_codes = nil
    end

    youtube_embed_codes
  end
end
