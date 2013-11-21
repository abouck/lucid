  $( document ).ready(function() {
    $( "#t_search" ).submit(function() {
      event.preventDefault();
      var searchString = {tweetsearch: tweetsearch.value};
      var searchParam = $.param (searchString);
      $.get('tweets/search.json?' + searchParam, function(profiletweets){
        $('.tweet_table').empty();
        profiletweets.forEach(function(tweet){
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
        });
      });
    });
  });