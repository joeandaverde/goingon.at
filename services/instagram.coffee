express = require "express"
app = module.exports = express.createServer()
config = require "../config/instagram"

class Instagram
   constructor: () ->
      # do some junk

   get: (url, callback) ->
      # this is a call to the instagram API

instagram = new Instagram()

app.get "/auth/instagram", () ->
   res.redirect "to the place"

app.get "/auth/instagram_callback", () ->
   # do some junk to get the access token

app.use (req, res, next) ->
   # Your middleware peice
      keys = req.session.services?.instagram
      instagram.access_token = keys?.access_token

   req.services or= {}
   req.services.instagram = instagram