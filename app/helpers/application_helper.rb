# frozen_string_literal: true

# This module provides helper methods for views.
module ApplicationHelper
  def default_meta_tags
    {
      site: 'お箏診断',
      title: 'お箏診断',
      reverse: true,
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      description: '診断をしてあなたの聞きたいお箏の曲を聞けます',
      keywords: 'お箏,お琴,音楽,診断',   #キーワードを「,」区切りで設定する
      canonical: request.original_url,   #優先するurlを指定する
      noindex: ! Rails.env.production?,
      og: {
        site_name: :site,
        title: 'お箏診断',
        description: '診断をしてあなたの聞きたいお箏の曲を聞けます',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@maec7gx24752',
        title: 'お箏診断',
        description: '診断をしてあなたの聞きたいお箏の曲を聞けます',
        image: image_url('ogp.png'),
      }
    }
  end
end
 
