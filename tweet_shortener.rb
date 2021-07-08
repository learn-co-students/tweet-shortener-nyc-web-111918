def dictionary
  output={["hello"]=>"hi", ["to", "two", "too"]=>"2", ["for", "four"]=>"4", ["be"]=>"b", ["at"]=>"@", ["and"]=>"&", ["you"]=>"u"}
  return output
end

def word_substituter(tweet)
    output=[]
    tweet.split(" ").collect do |x|
        replace=false
        dictionary.keys.each do |longwords|
            if longwords.include?(x.downcase)
                replace=dictionary[longwords]
            end
        end
        if replace==false
            output.push(x)
        else
            output.push(replace)
        end
    end
    output.join(" ")
end

def bulk_tweet_shortener(array)
  array.each do |x|
    puts word_substituter(x)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length>140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  newtweet=word_substituter(tweet)
  if newtweet.length>140
    newtweet=newtweet[0..136]+"..."
  end
  newtweet
end
