
class MapImage
   constructor: (@key) ->

   build: (lat, long, options) ->
      options ||= {}
      defaultOptions = 
         width: 2048
         height: 2048
         zoom: 12

      $.extend(defaultOptions, options)

      return "http://www.mapquestapi.com/staticmap/v3/getmap?key=#{@key}&size=#{defaultOptions.width},#{defaultOptions.height}&zoom=#{defaultOptions.zoom}&center=#{lat},#{long}&scalebar=false&declutter=true&mcenter=#{lat},#{long}"

   inject: (element, lat, long, options) ->
      insertionPoint = $(element)
      img = $("<img>")
      img.attr 'src', @build(lat, long, options)
      insertionPoint.append(img)

window.mapImage = new MapImage('Fmjtd%7Cluua2g6anq%2C2s%3Do5-hfrn9')

# http://www.mapquestapi.com/staticmap/v3/getmap?key=Fmjtd%7Cluua2g6anq%2C2s%3Do5-hfrn9&size=2048,2048&zoom=12&center=38.976924,-94.5208&scalebar=false&declutter=true&mcenter=38.976924,-94.5208