  $( document ).ready(function() {
    $( "#u_search" ).click(function() {
      $.get('searches/search.json?usersearch=' + usersearch.value, function(profiletweets){
        $('.tweet_table').empty();
        console.log(profiletweets);
        profiletweets.forEach(function(tweet){
          console.log(tweet.text);
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
        });
      });
    });
  });