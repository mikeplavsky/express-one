Notes = Ember.Application.create LOG_TRANSACTIONS:true

Notes.Router = Ember.Router.extend()

Notes.Router.map ->
  this.route 'notes', path: '/'

Notes.NotesRoute = Ember.Route.extend
  
  setupController: (controller) ->

    controller.set 'content', []
    selectedNoteController = this.controllerFor 'selectedNote'

    selectedNoteController.set 'notesController',controller

Notes.ApplicationController = Ember.Controller.extend {}

Notes.NotesController = Ember.ArrayController.extend

  content: [],
  selectedNote: null

Notes.TextField = Ember.TextField.extend Ember.TargetActionSupport,
  
  insertNewline: -> this.triggerAction()

Notes.SelectedNoteController = Ember.ObjectController.extend

  contentBinding: 'notesController.selectedNote',
  notesController: null

Notes.NotesView = Ember.View.extend

  elementId: 'notes',
  classNames: ['azureBlueBackground','azureBlueBorderThin']

Notes.SelectedNoteView = Ember.View.extend

  elementId: 'selectedNote',
  templateName: 'selecteddNoteTemplate'

exports.Notes = Notes

