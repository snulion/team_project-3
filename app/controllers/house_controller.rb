require 'nokogiri'
require 'open-uri'

class HouseController < ApplicationController
  def index
    doc_p = Nokogiri::HTML(open("https://www.poing.co.kr/seoul/restaurant/search?query%5Barea%5D=%EC%84%9C%EC%9A%B8%EB%8C%80%EC%9E%85%EA%B5%AC%EC%97%AD&query%5Border_rule%5D=average_grade&query%5Bper_page%5D=12"))
    @place_p=doc_p.css(".name")[1].inner_text         #포잉 2위 식당이름
    @img_p=doc_p.css(".image/@style")[1]              #포잉 2위 식당 이미지 url 주소
      
      
    @a="dc-restaurant-contents"
    doc_d = Nokogiri::HTML(open("http://www.diningcode.com/list.php?query=%EC%84%9C%EC%9A%B8%EB%8C%80%EC%9E%85%EA%B5%AC%EC%97%AD"))
    @place_d=doc_d.css("div") #다이닝코드 2위 식당이름

    
  
    doc_m = Nokogiri::HTML(open("http://www.mangoplate.com/search/%EC%84%9C%EC%9A%B8%EB%8C%80%EC%9E%85%EA%B5%AC%EC%97%AD?keyword=%EC%84%9C%EC%9A%B8%EB%8C%80%EC%9E%85%EA%B5%AC%EC%97%AD&page=1"))  
    @place_m=doc_m.css("span.title")[1].inner_text #망고플레이트 2위 식당이름
    
    @img_m=doc_m.css("div.thumb/@style")[1] #망고플레이트 2위 식당 이미지 url 주소
  end
  
  def about
  end
end




