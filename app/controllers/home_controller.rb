require 'rubygems'
require 'mechanize'
class HomeController < ApplicationController
  def crw
  
    agent = Mechanize.new 
    page = agent.get('http://class.likelion.net/users/sign_in')
    
    #pp page
    my_page = page.form_with(:action => '/users/sign_in') do |f|
      f.field_with(:name => 'user[email]').value = 'your email'
      f.field_with(:name => 'user[password]').value = 'your password'
    end.submit
    
    a = my_page.link_with(:href => '/lectures').click
    
    # doc = Nokogiri::HTML(open("#{a.url}"))
    # doc.css(".title").each { |x| puts x.inner_text }
    
    
    puts a.search('.title').map(&:text).join("\n")
        
  end
end
