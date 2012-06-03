ko = window.ko

viewModel = 
   instagrotos: ko.observable([])
   tweets: ko.observable([])

viewModel.strips = ko.computed () ->
   items = (_.map viewModel.instagrotos(), (instagroto) -> 
      instagroto.time = new Date instagroto.created_time * 1000
      instagroto.type = "instagroto"
      return instagroto
   ).concat(_.map viewModel.tweets(), (tweet) -> 
      tweet.time = new Date tweet.created_at
      tweet.type = "tweet"
      return tweet
   )

   _.sortBy items, (thing) -> thing.time * -1

fetchThings = (coords) ->
   $.getJSON "/location/instagrotos", coords, (photos) ->
      viewModel.instagrotos photos

   $.getJSON "/location/tweets", coords, (tweets) ->
      viewModel.tweets tweets

$(document).ready () ->
   ko.applyBindings viewModel
   fetchThings(window.coords)