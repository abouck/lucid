class Tweet < ActiveRecord::Base
  def self.analyze(tweets)
    wordArr = []
    tempHash = Hash.new(0)
    tweetHash = {}
    freqArr = []
    analyzer = Sentimental.new
    tweets.each do |tweet|
      thash = analyzer.get_score tweet[:text]
       case thash["score"]
        when 1.0...100.0
          thash["class"] = "sent-great"
        when 0.5..1
          thash["class"] = "sent-good"
        when 0.0001..0.5
          thash["class"] = "sent-ok"
        when 0.0
          thash["class"] = "sent-neutral"
        when -0.5..0.0
          thash["class"] = "sent-not-ok"
        when -1.0..-0.5
          thash["class"] = "sent-bad"
        when -100.0...-1.0
          thash["class"] = "sent-terrible"
        else
      end
      thash["keywords"].each do |key,value|
        wordArr.push(key)
      end
      tweet[:sentimental] = thash
    end
    wordArr.each { |word| tempHash[word] += 1 }
    tempHash.each do |key,value|
      freqArr << {"label" => key, "value" => value}
    end
    freqArr.sort_by! { |k| k["value"]}.reverse!
    freqArr.slice!(10..freqArr.length)
    tweetHash = {"freqArr" => freqArr, "tweets" => tweets}
  end
end
