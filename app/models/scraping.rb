class Scraping

  @@base_url = "http://review-movie.herokuapp.com/"

  def self.movie_urls
    # Mechanizeインスタンスを生成
    agent = Mechanize.new

    # 一覧ページのオブジェクトを取得
    page = agent.get(@@base_url)

    # 各個別ページのリンクを取得
    elements = page.search('.entry-title a')

    # 各個別ページに対してget_productメソッドを実行する
    elements.each do |ele|
      link = ele.get_attribute("href")
      get_product(link)
    end
  end

  def self.get_product(link)
    # Mechanizeインスタンスを生成
    agent = Mechanize.new

    # 個別ページのオブジェウトを取得
    page = agent.get(@@base_url + link)

    # 必要な情報をスクレイピング
    title = page.at('#post-single h2').inner_text
    image_url = page.at('.entry-content img').get_attribute("src")
    director = page.at('.director span').inner_text
    open_date = page.at('.date span').inner_text

    # 取得した情報をデータベースに格納する
    Product.create(title: title, image_url: image_url, director: director, open_date_string: open_date, open_date: open_date)

    # コメント
    # date型変数(open_date)にそのまま日付を渡してもDBには登録されない。
    # この場合、INSERT文からopen_dateが取り除かれるため、SQLでエラーにならない。
    # この処理はActive::Recordによるものと考えられる。
  end
end