require 'rss'
require 'open-uri'

class RssReader
  puts "#{Time.now} start update rss crawling"
  # url = "https://sungjk.github.io/feed.xml"
  # URI.open(url) do |rss|
  #   # feed = RSS::Parser.parse(rss).items.first
  #   feed = RSS::Parser.parse(rss)
  #   # p feed.is_a? RSS::Atom::Feed
  #   first_feed = feed.items.first
  #   p first_feed.link
  #   # p first_feed.updated.content
  #   # p first_feed.updated.content
  #   # p first_feed.title.content
  #   # p first_feed.link.href
  #   # p first_feed.published.content
  #   # feed.categories.each do |cc|
  #   #   p cc.term
  #   # end
  # end

  TAG_EXCEPTIONS = [RSS::MissingTagError, RSS::TooMuchTagError]
  
  authors = Author.all

  authors.each_with_index do |author, idx|
    begin
      URI.open(author.rss) do |rss|
        begin
          feed = RSS::Parser.parse(rss)
        rescue *TAG_EXCEPTIONS
          feed = RSS::Parser.parse(rss, false)
        end

        if feed.is_a? RSS::Atom::Feed
          first_feed = feed.items.first
          post_date = first_feed.published.nil? ? first_feed.updated.content : first_feed.published.content
          break if post_date.nil? || !post_date.to_datetime.today?

          post_params = {
            author_id: author.id,
            title: first_feed.title.content,
            link: first_feed.link.href,
            post_date: post_date
          }

          post = Post.create!(post_params)

          unless first_feed.categories.empty?
            tags = first_feed.categories

            tags.uniq.map do |tag|
              next if tag.term == "Uncategorized"
              hashtag = Tag.find_or_create_by(name: tag.term)
              post.tags << hashtag
            end
          end

        elsif feed.is_a? RSS::Rss
          first_feed = feed.items.first
          break if first_feed.pubDate.nil? || !first_feed.pubDate.to_datetime.today?

          post_params = {
            author_id: author.id,
            title: first_feed.title,
            link: first_feed.link,
            post_date: first_feed.pubDate
          }

          post = Post.create!(post_params)

          unless first_feed.categories.empty?
            tags = first_feed.categories

            tags.uniq.map do |tag|
              next if tag.content == "Uncategorized"
              hashtag = Tag.find_or_create_by(name: tag.content)
              post.tags << hashtag
            end
          end
        end
      end
    rescue OpenURI::HTTPError => e
      puts "--------------404 not found error start--------------"
      puts "author is deleted because of 404 not found error! rss: #{author.rss}"
      # author.destroy
      puts "--------------404 not found error end--------------"
    rescue SocketError => e
      puts "--------------socker error start--------------"
      puts "author is deleted because of socket error! rss: #{author.rss}"
      # author.destroy
      puts "--------------socker error end--------------"
    rescue => e
      puts "==============error=============="
      puts "something went wrong! at #{author.rss} "
      # puts "#{e} : #{e.message}"
      p e
      puts "==============error=============="
      # puts "#{e} : #{e.message}\n" + e.backtrace.join("\n")
    end
  end

  puts "#{Time.now} end update rss crawling"
end