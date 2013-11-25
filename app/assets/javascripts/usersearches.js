  $( document ).ready(function() {
  var display, key, plot, text;
  plot = Bubbles();
  display = function(data) {
    return plotData("#vis", data, plot);
  };
  $("#text-select").val(key);
  d3.select("#jitter2").on("input", function() {
    return plot.jitter(parseFloat(this.output.value));
  });
    $( "#u_search" ).submit(function() {
      event.preventDefault();
      if(!(usersearch.value).match(/^@[a-z0-9_]{1,15}$/)) {
        alert("Please enter a valid username")
      }
        else {
          $('.jumbotron').animate({'margin-top': "-450px"}, 1000)
          $.get('searches/search.json?usersearch=' + usersearch.value, function(profiletweets){
            $('.tweet_table').empty();
            $('#vis').empty();
            profiletweets.tweets.forEach(function(tweet){
              $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
            });
            $("#container").show();
            display(profiletweets.freqArr);
            d3.select("#book-title").html(usersearch.value);
            
          });
        }
    });
  });