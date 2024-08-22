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
    @youtube_embed_codes = []

    case @result.id
    when 1
      @youtube_embed_codes << '<iframe src="https://www.youtube.com/embed/WiMo8F6rKA8?" title="頭上からの視点で『六段の調』iPhoneXSでの撮影　“Rokuden” take an overhead view."  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>'
    when 2
      @youtube_embed_codes << '<iframe src="https://www.youtube.com/embed/kQrFZ8e1E0g?" title="「春の海幻想」【加東邦楽演奏会2021】" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>'
    when 3
      @youtube_embed_codes << '<iframe src="https://www.youtube.com/embed/YmGTJ6SGeUU" title="【箏曲部】この音とまれ! / 天泣 プロ奏者が弾いてみた！(konoototomare , tenkyu , anime)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>'
    when 4
      @youtube_embed_codes << '<iframe src="https://www.youtube.com/embed/2gQzPktFU5A?" title="箏独奏曲「線香花火」宮城道雄作曲" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>'
      @youtube_embed_codes << '<iframe src="https://www.youtube.com/embed/-_jqps7Yd6Q?" title="【箏三重奏】翊－あくるひ－（作曲：橋本みぎわ）" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>'
    when 5
      @youtube_embed_codes << '<iframe src="https://www.youtube.com/embed/YmGTJ6SGeUU" title="【箏曲部】この音とまれ! / 天泣 プロ奏者が弾いてみた！(konoototomare , tenkyu , anime)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>'
    when 6
      @youtube_embed_codes << '<iframe src="https://www.youtube.com/embed/01v4fttX8sM?" title="千本桜 箏独奏　Senbonzakura on Koto solo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>'
    when 7
      @youtube_embed_codes << '<iframe src="https://www.youtube.com/embed/IpB6Vck3kQY?" title="箏三重奏「炎」 KOTO trio plays &quot;HOMURA&quot; from Demon Slayer: Kimetsu no Yaiba" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube"></iframe>'
    else
      @youtube_embed_codes = nil
    end
  end

  def create
    @diagnosis = Diagnosis.find(params[:diagnosis_id])
    @result = @diagnosis.build_result(result_params)

    if @result.save
      flash[:notice] = "結果が保存されました"
      redirect_to result_path(@result.id)
    else
      render :new
    end
  end

  private

  def result_params
    params.require(:result).permit(:title)
  end
end
