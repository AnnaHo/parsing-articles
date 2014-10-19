class ArticlesController < ApplicationController
  
  def index
    @articles = fetch_article
  end
  
  private
  
  def fetch_article
    article = File.read('public/articles.xml')
    articles = article.scan(/<title>(.+)<\/title>\s+<link>.+<\/link>\s+<comments>.+<\/comments>\s+<pubDate>(.+)<\/pubDate>/)
    articles.sort_by!{|a,b|a[1].to_time <=> b[1].to_time}
  end
end