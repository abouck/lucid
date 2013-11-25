$( document ).ready(function() {
  var display, key, plot, text;
  plot = Bubbles();
  display = function(data) {
    return plotData("#vis", data, plot);
  };
  $("#text-select").val(key);
  d3.select("#jitter3").on("input", function() {
    return plot.jitter(parseFloat(this.output.value));
  });
    $( "#profiletweets" ).click(function() {
      $('.jumbotron').animate({'margin-top': "-450px"}, 1000)
      $.get('profilesearches/profiletweets.json', function(profiletweets){
        $('.tweet_table').empty();
        $('#vis').empty();
        profiletweets.tweets.forEach(function(tweet){
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")          
        });
        $("#container").show();
        display(profiletweets.freqArr);
        d3.select("#book-title").html("your tweets!");
      });
    });
  


    $( "#profilehome" ).click(function() {
      $('.jumbotron').animate({'margin-top': "-450px"}, 1000)
      $.get('profilesearches/profilehome.json', function(profilehome){
        $('.tweet_table').empty();
        $('#vis').empty();
        profilehome.tweets.forEach(function(tweet){
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
        });
        $("#container").show();
        display(profilehome.freqArr);
        d3.select("#book-title").html("your feed!");
      });
    });


    $( "#profilementions" ).click(function() {
      $('.jumbotron').animate({'margin-top': "-450px"}, 1000)
      $.get('profilesearches/profilementions.json', function(profilementions){
        $('.tweet_table').empty();
        $('#vis').empty();
        profilementions.tweets.forEach(function(tweet){
          $('.tweet_table').append("<tr class='"+ tweet.sentimental.class + "'><td><a href='http://www.twitter.com/" + tweet.user.screen_name + "'>" + tweet.text + "</a></td></tr>")
        });
        $("#container").show();
        display(profilementions.freqArr);
        d3.select("#book-title").html("your mentions!");
      });
    });
  });