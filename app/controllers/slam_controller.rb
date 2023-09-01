require 'nokogiri'
require 'httparty'
require 'cgi'

class SearchController < ApplicationController
  def index
    keyword = params[:keyword]
    return unless keyword
    final_keyword = "聖地巡礼 #{keyword}"
    search_term = CGI.escape(final_keyword)
    url = "https://www.google.com/search?q=#{search_term}&tbm=isch"

    response = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(response.body)

    # Googleの画像検索結果から画像URLを取得（要素のCSSセレクタは適宜調整）
    image_elements = parsed_page.css('img')
    @image_urls = image_elements.map do |element|
      element.attr('src')
    end.slice(1..10)
  end
  
end

