express = require "express"
port = process.env.PORT || 3000
app = express.createServer()

# Settings
app.set "view engine", "jade"
app.set "view settings", { layout: false }

app.configure "development", () ->
   app.use express.logger "dev"
   app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.configure "production", () ->
   app.use express.errorHandler()

# Middleware
app.use express.cookieParser()
app.use express.session secret: "aksdf2342awjefna3fnoiasdfojasofoadngfiha34isfh"
app.use require("connect-assets")()
app.use express.static __dirname + "/../public"

# Services
app.use require "../services/instagram"

# Controllers
app.use require "./dashboard"

app.listen port
console.log "goingon.at listening on #{port}"