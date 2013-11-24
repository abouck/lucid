  $( document ).ready(function() {
  var display, key, plot, text;
  plot = Bubbles();
  display = function(data) {
    return plotData("#vis", data, plot);
  };
  $("#text-select").val(key);
  d3.select("#jitter").on("input", function() {
    return plot.jitter(parseFloat(this.output.value));
  });
      $( "#t_search" ).submit(function() {
      event.preventDefault();
      $('.jumbotron').animate({'margin-top': "-450px"}, 1000)
      var searchString = {tweetsearch: tweetsearch.value};
      var searchParam = $.param (searchString);
      $.get('tweets/search.json?' + searchParam, function(profiletweets){
        $('.tweet_table').empty();
        $('#vis').empty();
        profiletweets.tweets.forEach(function(tweet){
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
        });
        display(profiletweets.freqArr);
        d3.select("#book-title").html(tweetsearch.value);

      });
    });
});