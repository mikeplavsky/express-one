express = require "express"
stitch = require "stitch"
stylus = require "stylus"

pack = stitch.createPackage paths: [__dirname + "/public/app"]
tests = stitch.createPackage paths: [__dirname + "/test"]

app = express()

app.get "/application.js", pack.createServer()
app.get "/test.app.js", tests.createServer()

app.get "/", (req,res)->
  res.render "index", title: 'express'

app.get "/grid", (req,res)->
  res.render "grid", title: 'express'

app.get "/ember", (req,res)->
  res.render "ember", title: 'express'

app.get "/angular", (req,res)->
  res.render "angular", title: 'express'

app.get "/notes", (req,res)->
  res.render "notes", title: 'express'

app.get "/tests", (req,res)->
  res.render "tests", title: 'tests'
 
app.configure ->
  app.use express.logger('dev')
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'ejs'
  app.use express.directory("public")

  app.use stylus.middleware
    src: "#{__dirname}/public"
    dst: "#{__dirname}/public"
  
  app.use express.static "#{__dirname}/public"
  app.use express.static "#{__dirname}/node_modules"

app.listen 80
console.log "Listening 0.0.0.0:80"
