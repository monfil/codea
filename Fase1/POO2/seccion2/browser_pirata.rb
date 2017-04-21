require 'nokogiri'
require 'open-uri'

class Page
  def initialize(url)
    @url = url.join("")
    @doc = Nokogiri::HTML(open(@url))
    @links = []
    @label_links = []
  end

  def fetch!
    puts "url> #{@url}"
    puts "Fetching..."
    puts 
    puts "Title: #{title}"
    puts "Links:"
    puts "#{@label_links[0..3]}: #{@links[2]}"
    puts "#{@label_links[4..23]}: #{@links[3]}"
    puts "#{@label_links[24..27]}: #{@links[4]}"
    puts "#{@label_links[28..33]}: #{@links[5]}"
    puts "#{@label_links[35..44]}: #{@links[6]}"
    puts "...\nurl>"
  end

  def title
    @doc.search("title").inner_text
  end

  def links
    p @links = @doc.css("nav a").map { |link| link["href"]}
    p @label_links = @doc.search(".nav li > a").inner_text
  end

end

class Browser
  def run!
    page = Page.new(ARGV)
    page.links
    page.fetch!
  end
end

Browser.new.run!