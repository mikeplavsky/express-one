app = require "app"

describe "Mocha", ->
  describe "execution time", ->

    it "shoud warn if running time is more than 1sec", (done) ->
      setTimeout (->
        done()),
        1000

    it "shoud be ok if running time is less than 1sec", (done) ->
      setTimeout (->
        done()),
        10

    it "shoud fail if running time is more than 2sec", (done) ->
      setTimeout (->
        done()),
        2500

    it "pending should be visible"

describe "Model", ->

  it "should exist", ->
    expect.ok new app.Model()

