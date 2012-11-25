express = require "express"
path = require "path"

app = express()

app.get "/", (req,res)->
  res.render "index", title: 'express'

app.configure ->
  app.use express.logger('dev')
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'ejs'
  app.use express.static(path.join __dirname, "public")

app.listen 3000
console.log "Listening 0.0.0.0:3000"
