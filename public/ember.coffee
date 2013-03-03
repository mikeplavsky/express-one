init = ->

  App = Ember.Application.create() #( LOG_TRANSITIONS: true)

  App.Router.map ->

    this.route "about", path: "/about"
    this.route "favorites", path: "/favs"
    this.route "people", path: "/people"


  App.PeopleController = Ember.Controller.extend
    people: [
      {firstName: "Ember", lastName: "JS" },
      {firstName: "Ember", lastName: "Coffee" }
    ]

  App.PeopleRoute = Ember.Route.extend
    
    setupController: (controller)->
      controller.people.push {firstName: "Mike", lastName: "Next"}
      controller.set( 'content', 'Wow')

  App.initialize()

  App

exports.init = init
