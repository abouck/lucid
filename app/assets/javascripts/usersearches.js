  $( document ).ready(function() {
    $( "#u_search" ).submit(function() {
      event.preventDefault();
      if(!(usersearch.value).match(/^@[a-z0-9_]{1,15}$/)) {
        alert("Please enter a valid username")
      }
        else {
          $.get('searches/search.json?usersearch=' + usersearch.value, function(profiletweets){
            $('.tweet_table').empty();
            profiletweets.forEach(function(tweet){
              $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
            });
          });
        }
    });
  });