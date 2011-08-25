require 'date'
require 'time'

def pages
  @items.select { |item| item.page? }.sort_by{ |item| item[:order] }
end

def articles
  @items.select { |item| item.article? }.sort_by{ |item| Time.parse(item[:date].to_s) }.reverse
end

def gravatar_for(email)
  md5 = Digest::MD5.hexdigest email
  'http://www.gravatar.com/avatar/' + md5
end

# need to move this to an instance method of Member
def member_articles(member)
  articles.select do |item|
    item[:author] == member.filename
  end
end

def title(item)
  if item[:title]
    (item[:title] + ' | ' + COPY['title']).titleize
  else
    COPY['title'].titleize
  end 
end
