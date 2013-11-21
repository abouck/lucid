$( document ).ready(function() {
    $( "#profiletweets" ).click(function() {
      $.get('profilesearches/profiletweets.json', function(profiletweets){
        $('.tweet_table').empty();
        profiletweets.forEach(function(tweet){
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
        });
      });
    });
  


    $( "#profilehome" ).click(function() {
      $.get('profilesearches/profilehome.json', function(profilehome){
        $('.tweet_table').empty();
        profilehome.forEach(function(tweet){
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
        });
      });
    });


    $( "#profilementions" ).click(function() {

      $.get('profilesearches/profilementions.json', function(profilementions){
        $('.tweet_table').empty();
        profilementions.forEach(function(tweet){
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
        });
      });
    });
  });