init = ->

  Notes = Ember.Application.create()
  Notes.Router = Ember.Router.extend()

  Notes.Router.map ->
    this.route 'Notes', path: "/"

  Notes.NotesRoute = Ember.Route.extend

    setupController: (controller) ->

      controller.set 'content', []
      selectedNoteController = this.controllerFor 'selectedNote'
      selectedNoteController.set 'notesController', controller 

  Notes.ApplicationController = Ember.Controller.extend {}
  Notes.NotesController = Ember.ArrayController.extend
    
    content: [],
    newNoteName: null

  Notes.TextField = Ember.TextField.extend Ember.TargetActionSupport,

    insertNewline: ->
      this.triggerAction()

  Notes.SelectedNoteController = Ember.ObjectController.extend
     
    contentBinding: 'notesController.selectedNote',
    notesController: null

  Notes.ApplicationView = Ember.View.extend templateName: 'applicationTemplate'
  Notes.NotesView = Ember.View.extend

    elementId: 'notes',
    classNames: ['azureBlueBackground', 'azureBlueBorderThin']
  
  Notes.SelectedNoteView = Ember.View.extend elementId: 'selectedNode'

  Ember.TEMPLATES['application'] = Ember.Handlebars.compile '{{outlet}}{{render selectedNote}}'
  Ember.TEMPLATES['applicationTemplate'] = Ember.Handlebars.compile ''

  Ember.TEMPLATES['notes'] = Ember.Handlebars.compile ''
  Ember.TEMPLATES['selectedNote'] = Ember.Handlebars.compile ''

  Ember.TEMPLATES['notesTemplate'] = Ember.Handlebars.compile """
  {{view Notes.TextField target="controller" action="createNewNote"
  """

  Notes
   

exports.init = init
