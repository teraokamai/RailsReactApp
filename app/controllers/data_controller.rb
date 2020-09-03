class DataController < ApplicationController
  def index
  end

  def ajax
    # url = "https://news.yahoo.co.jp/pickup/rss.xml" # Yahoo
    url = "https://digiday.jp/feed/" # DIGIDAY 日本版
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri) # 指定したアドレスにアクセスしてレスポンスを得る
    render plain: Hash::from_xml(response.body).to_json # XMLデータをハッシュ に変換し、更にJSONに変換する
  end
end
