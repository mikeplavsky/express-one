express = require "express"
stitch = require "stitch"

pack = stitch.createPackage paths: [__dirname + "/public"]
app = express()

app.get "/application.js", pack.createServer()

app.get "/", (req,res)->
  res.render "index", title: 'express'

app.configure ->
  app.use express.logger('dev')
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'ejs'
  app.use express.directory("public")

app.listen 3000
console.log "Listening 0.0.0.0:3000"
