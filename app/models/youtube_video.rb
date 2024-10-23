# frozen_string_literal: true

# This class represents a YouTube video in the application.
class YoutubeVideo < ActiveHash::Base

  self.data = [
    {
      id: 1,
      result_id: 1,
      title: '六段の調',
      description: '箏を弾くなら避けられない曲',
      embed_code: '<iframe src="https://www.youtube.com/embed/WiMo8F6rKA8"
      title="頭上からの視点で『六段の調』iPhoneXSでの撮影"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 2,
      result_id: 1,
      title: '春の海',
      description: 'お正月の曲です',
      embed_code: '<iframe src="https://www.youtube.com/embed/M0qM5zrWock"
      title="春の海（三橋貴風・沢井忠夫）／Haru no Umi（Spring Sea）"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 3,
      result_id: 1,
      title: '「さくらさくら」',
      description: '誰もが知っている曲、春になるとスーパーでよく聞きますね',
      embed_code: '<iframe src="https://www.youtube.com/embed/TgMC-AKTXLQ?"
      title="おことで「さくらさくら」を弾いてみよう！"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;
      web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 4,
      result_id: 2,
      title: '「春の海幻想」',
      description: 'お正月に聞く曲のアレンジ版、聞いたことあるフレーズが出てきます！',
      embed_code: '<iframe src="https://www.youtube.com/embed/kQrFZ8e1E0g?"
      title="「春の海幻想」 【加東邦楽演奏会2021】"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 5,
      result_id: 2,
      title: '「筝曲 「さくら」箏独奏による主題と六つの変奏」',
      description: 'あの穏やかな曲がこんな激しくなるとはびっくりします！最後まで聞いてみてください',
      embed_code: '<iframe src="https://www.youtube.com/embed/3wvQk57vwHY"
      title="筝曲 「さくら」箏独奏による主題と六つの変奏木村園代 Japanese koto"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 6,
      result_id: 2,
      title: '「さくら幻想曲」（編曲：河村利夫）',
      description: '大人数ならではの合奏の迫力があります。もちろん聞いたことあるフレーズもでてきます！',
      embed_code: '<iframe src="https://www.youtube.com/embed/djDMaWs2ABI"
      title="さくら幻想曲（編曲：河村利夫）　坂下憲吾門下"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 24,
      result_id: 2,
      title: '「さくらさくら　箏独奏」（編曲：稲葉美和）',
      description: '最初から迫力があり桜の花びらがたくさん舞い散る光景が見えます',
      embed_code: '<iframe src="https://www.youtube.com/embed/dR2HKQX1jd4"
      title="さくらさくら　箏独奏　編曲：稲葉美和"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 25,
      result_id: 2,
      title: '「さくら変奏曲」',
      description: '最初から迫力があり桜の花びらがたくさん舞い散る光景が見えます',
      embed_code: '<iframe src="https://www.youtube.com/embed/MKmWDL1wJvA"
      title="Japanese Koto さくら変奏曲/Sakura hensokyoku（Theme and Variations on the Sakura Melody)"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 7,
      result_id: 3,
      title: 'この音とまれ! / 「天泣」',
      description: 'アニメではこのシーン号泣しました。今練習していますが激ムズです。',
      embed_code: '<iframe src="https://www.youtube.com/embed/YmGTJ6SGeUU"
      title="【箏曲部】この音とまれ! / 天泣 プロ奏者が弾いてみた！"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 8,
      result_id: 3,
      title: 'この音とまれ! /「龍星群」',
      description: '音楽は１分４０秒ごろから始まります。高校生の時文化祭で弾いたのを思い出します。',
      embed_code: '<iframe src="https://www.youtube.com/embed/Y_Db88Ef6FQ"
      title="この音とまれ! 作中オリジナル楽曲「龍星群」"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 9,
      result_id: 3,
      title: 'この音とまれ! /「久遠」',
      description: '作中で初めてコンクールで弾いた曲です。本番までの道のりは青春がつまってます！！',
      embed_code: ' <iframe src="https://www.youtube.com/embed/yegQRUhJkuM"
      title="この音とまれ! 作中オリジナル楽曲「久遠」"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 10,
      result_id: 4,
      title: '「二つの群の為に」',
      description: '最初から衝撃です',
      embed_code: '<iframe src="https://www.youtube.com/embed/JhMK0Awbiuk?"
      title="二つの群の為に (沢井忠夫作曲) ／FUTATSU NO GUN NO TAME NI(by Sawai,Tadao)"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto ">
      </iframe>'
    },
    {
      id: 11,
      result_id: 4,
      title: '箏独奏曲「線香花火」',
      description: '宮城道雄作曲',
      embed_code: ' <iframe src="https://www.youtube.com/embed/2gQzPktFU5A?"
      title="箏独奏曲「線香花火」宮城道雄作曲"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 12,
      result_id: 4,
      title: '【箏三重奏】翊－あくるひ－',
      description: '作曲：橋本みぎわ、この音とまれ！の曲を作曲している方です',
      embed_code: '<iframe src="https://www.youtube.com/embed/-_jqps7Yd6Q?"
      title="【箏三重奏】翊－あくるひ－（作曲：橋本みぎわ）"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 13,
      result_id: 4,
      title: '「絵空箏／ESORAGOTO」',
      description: '「二つの群の為に」を作曲した息子さんの曲です。',
      embed_code: '<iframe src="https://www.youtube.com/embed/HmY1WieykpE"
      title="絵空箏／ESORAGOTO　　（沢井比河流 作曲／composed by Sawai, Hikaru）"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 14,
      result_id: 5,
      title: '「絵てがみ」',
      description: '10月の演奏会で弾く曲です。きれいな曲なので弾いていて楽しいです。',
      embed_code: '<iframe src="https://www.youtube.com/embed/9h-WLGVXzEo?"
      title="『絵てがみ』Etegami"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto ">
      </iframe>'
    },
    {
      id: 15,
      result_id: 5,
      title: '「遊郭」',
      description: '遊郭を創造しながら聞くと悲しい気分になってきます。時代の厳しさを物語っています',
      embed_code: '<iframe src="https://www.youtube.com/embed/VXdFX8ON2bQ?"
      title="『遊郭』Yuukaku"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 16,
      result_id: 5,
      title: '「桃花流水～三国志によせて～」',
      description: '歌もあって華やかな曲です。三国志ということもあり曲調も中国っぽいです！',
      embed_code: '<iframe src="https://www.youtube.com/embed/g2GQ-A70a6U"
      title="【生田流 淀の会】桃花流水～三国志によせて～"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto ">
      </iframe>'
    },
    {
      id: 17,
      result_id: 6,
      title: '「紅蓮華 」',
      description: 'アニメ「鬼滅の刃」op です',
      embed_code: '<iframe src="https://www.youtube.com/embed/reCGcMYN9-U?"
      title="#鬼滅の刃 #箏 #紅蓮華 【練習風景２２】アニメ「鬼滅の刃」OP紅蓮華（和楽器一人３重奏）"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto ">
      </iframe>'
    },
    {
      id: 18,
      result_id: 6,
      title: '「千本桜 」箏独奏',
      description: '手の動きに注目！',
      embed_code: '<iframe src="https://www.youtube.com/embed/01v4fttX8sM?"
      title="千本桜 箏独奏 Senbonzakura on Koto solo"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto ">
      </iframe>'
    },
    {
      id: 19,
      result_id: 6,
      title: '『ムーンライト伝説』箏三重奏',
      description: 'セーラームーンの曲です♪セーラームーンごっこをしていたのが懐かしいです',
      embed_code: '<iframe src="https://www.youtube.com/embed/PXzLvVcYKIo"
      title="『ムーンライト伝説』箏三重奏　Sailor moon opening theme on koto trio"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto ">
      </iframe>'
    },
    {
      id: 20,
      result_id: 7,
      title: '箏三重奏「炎」',
      description: '鬼滅の刃',
      embed_code: '<iframe src="https://www.youtube.com/embed/IpB6Vck3kQY?"
      title="箏三重奏「炎」 KOTO trio plays &quot;HOMURA&quot; from Demon Slayer: Kimetsu no Yaiba"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto ">
      </iframe>'
    },
    {
      id: 21,
      result_id: 7,
      title: '「人生のメリーゴーランド」（ハウルの動く城）',
      description: '高校生の時先輩方がこの曲を弾いていてきれいだなと思い筝曲部に入部するきっかけになった曲です',
      embed_code: '<iframe src="https://www.youtube.com/embed/LczZznH1yLY?"
      title="【多重演奏】お琴で「人生のメリーゴーランド」／映画「ハウルの動く城」より"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto ">
      </iframe>'
    },
    {
      id: 22,
      result_id: 7,
      title: '「やさしさに包まれたなら」（魔女の宅急便）',
      description: '魔女の宅急便がみたくなりますね',
      embed_code: '<iframe src="https://www.youtube.com/embed/Q001PsPgdZQ?"
      title="箏（琴）三重奏「やさしさに包まれたなら」"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    },
    {
      id: 23,
      result_id: 7,
      title: '「レット・イット・ゴー」箏三重奏',
      description: '社会現象になったアナと雪の女王の曲です。♪ありの～ままの～',
      embed_code: '<iframe src="https://www.youtube.com/embed/oSKqtwSHjXM"
      title="『レット・イット・ゴー』箏三重奏　Let It Go　from &quot;Frozen&quot; on koto trio"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      referrerpolicy="strict-origin-when-cross-origin" allowfullscreen class="youtube mx-auto">
      </iframe>'
    }
  ]
end
