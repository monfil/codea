require 'nokogiri'
require 'open-uri'

class TwitterScrapper
  
  def initialize(url)
    @twitter_account = Nokogiri::HTML(open(url.join("")))
  end

  def extract_userinfo
    user_info = []
    user_info << @twitter_account.search(".ProfileHeaderCard-name > a").first.inner_text
    user_info << @twitter_account.search(".u-linkComplex-target").first.inner_text
    user_info << @twitter_account.search(".ProfileHeaderCard-bio").inner_text
    user_info << @twitter_account.search(".ProfileHeaderCard-locationText").inner_text.chop!.strip!
    user_info << extract_stats
    user_info
  end

  def extract_stats
    stats = []
    stats << @twitter_account.search(".ProfileNav-value").first.inner_text
    stats << @twitter_account.search(".ProfileNav-stat.ProfileNav-stat--link.u-borderUserColor.u-textCenter.js-tooltip.js-openSignupDialog.js-nonNavigable.u-textUserColor > span.ProfileNav-value")[0].inner_text
    stats << @twitter_account.search(".ProfileNav-stat.ProfileNav-stat--link.u-borderUserColor.u-textCenter.js-tooltip.js-openSignupDialog.js-nonNavigable.u-textUserColor > span.ProfileNav-value")[1].inner_text
    stats << @twitter_account.search(".ProfileNav-stat.ProfileNav-stat--link.u-borderUserColor.u-textCenter.js-tooltip.js-openSignupDialog.js-nonNavigable.u-textUserColor > span.ProfileNav-value")[2].inner_text
    stats << @twitter_account.search(".ProfileNav-stat.ProfileNav-stat--link.u-borderUserColor.u-textCenter.js-tooltip.js-openSignupDialog.js-nonNavigable.u-textUserColor > span.ProfileNav-value")[3].inner_text
  end
  
  def extract_tweets
    tweets = @twitter_account.search('.tweet')
    tweets.pop
    tweets.map do |tweet|
      time = tweet.css(".content .tweet-timestamp ._timestamp").inner_text
      text = tweet.css(".content .js-tweet-text-container .TweetTextSize").inner_text
      rt = tweet.css(".content .ProfileTweet-action--retweet .ProfileTweet-actionCount").inner_text.strip!.split

      fav = tweet.search(".content .ProfileTweet-action--favorite .ProfileTweet-actionCount").inner_text.strip!.split
        puts "#{time}: #{text} "
        puts "RT:#{rt[0]}    Fav: #{fav[0]} \n\n"
    end
    return ""
  end

  def print
    puts "Username: #{extract_userinfo[0]}"
    puts "@#{extract_userinfo[1]}"
    puts "Bio: #{extract_userinfo[2]}"
    puts "Location: #{extract_userinfo[3]}"
    puts "-" * 100
    puts "Stats: Tweets: #{extract_userinfo[4][0]}, Following: #{extract_userinfo[4][1]}, Followers: #{extract_userinfo[4][2]}, Likes: #{extract_userinfo[4][3]}, Lists: #{extract_userinfo[4][4]}"
    puts "-" * 100
    puts "Tweets:\n\n"
    extract_tweets
  end

end

TwitterScrapper.new(ARGV).print