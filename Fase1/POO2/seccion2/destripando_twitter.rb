require 'nokogiri'
require 'open-uri'

class TwitterScrapper
  
  def initialize(url)
    @twitter_account = Nokogiri::HTML(open(url.join("")))
    @user_info = []
  end

  def extract_userinfo
    @user_info << @twitter_account.search(".ProfileHeaderCard-name > a").first.inner_text
    @user_info << @twitter_account.search(".u-linkComplex-target").first.inner_text
    @user_info << @twitter_account.search(".ProfileHeaderCard-bio").inner_text
    @user_info << @twitter_account.search(".ProfileHeaderCard-locationText").inner_text.chop!.strip!
    @user_info << extract_stats
    extract_tweets
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
      p rt = tweet.css('.content .stream-item-footer .ProfileTweet-actionList.js-actions .ProfileTweet-action.ProfileTweet-action--retweet.js-toggleState.js-toggleRt .ProfileTweet-actionButton.js-actionButton.js-actionRetweet .IconTextContainer .ProfileTweet-actionCount .ProfileTweet-actionCountForPresentation').first.inner_text.strip!
      p fav = tweet.search('.content .stream-item-footer .ProfileTweet-actionList.js-actions .ProfileTweet-action.ProfileTweet-action--favorite.js-toggleState .ProfileTweet-actionButton.js-actionButton.js-actionFavorite .IconTextContainer .ProfileTweet-actionCount').inner_text.strip!
        puts "#{time}: #{text} "
        puts "RT:#{rt}    Fav: #{fav} "
      end
  end

end

p TwitterScrapper.new(ARGV).extract_userinfo