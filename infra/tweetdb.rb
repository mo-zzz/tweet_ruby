require 'twitter'

class TweetDB
  #< TweetRepository
  def get_tweets(searchword)
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "PfOUL7epTTNtVJQBLnEglSm3I"
        config.consumer_secret     = "suGjjb4KYHoW4BzegZzKdKsldyBNkcAZMhkI5FDOcu5xzxGDor"
        config.access_token        = "733833319108870145-oNsxolcAZueC3IZ6k2er8JAwSLWTTq6"
        config.access_token_secret = "rSIVPjozdGrpMSGKAI9VTEPSabRhd7WNsLFTO7MXfzggR"
      end
      since_id = nil
      # count : 取得する件数
      # result_type : 内容指定。recentで最近の内容、popularで人気の内容。
      # exclude : 除外する内容。retweetsでリツイートを除外。
      # since_id : 指定ID以降から検索だが、検索結果が100件以上の場合は無効。
      result_tweets = client.search(searchword, count: 100, result_type: "recent", exclude: "retweets", since_id: since_id,filter:"links")

      result_tweets.take(100).each_with_index do |tw, i|
        if tw.full_text.index("http") == nil then
          puts "#{i} : #{tw.user.screen_name} : #{tw.full_text}"
        end
      end
  end

end