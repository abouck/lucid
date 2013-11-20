class Search < ActiveRecord::Base
  def self.analyze(tweets)
    analyzer = Sentimental.new
    tweets.each do |tweet|
      thash = analyzer.get_score tweet.text
      tweet.attrs[:sentimental] = thash
    end
  end
end