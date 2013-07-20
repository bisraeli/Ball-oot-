require ‘nokogiri’
require ‘pry’
require ‘open-uri”


doc = Nokogiri::HTML(open(‘http://www.reddit.com/’))



doc.css('.title').each do |title|
  puts title
end

doc.css('.attributes["href"].value')
end


# doc.css('.subtext a').each_with_index do |item,index|
#   if (index %2 == 1) then
#     if item.text[0..1].to_i > 0
#       puts item.text[0..1].to_i
#     end
#   end
# end



# comments = []
# doc.search(‘.subtext’).each do |subtext|
# comments << subtext.text.split(‘|’)[1]
# end
# ########################## Alice's answer########################
# doc.css('.subtext a').each do |comments|
#   puts comment



# #From the front page of http://reddit.comments
# #Get all the Titles of artciles. GEt all the links to the article
# #Get all the submitter names, and the links to their account.
# #Output these to the page.