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

  content: []
  selectedNote: null

  newNoteName: null

  createNewNote: ->

    content = this.get 'content'
    newNoteName = this.get 'newNoteName'

    content.pushObject Ember.Object.create
      name: newNoteName
      value: ""

    this.set 'newNoteName', null

Notes.TextField = Ember.TextField.extend Ember.TargetActionSupport,
  
  insertNewline: -> this.triggerAction()

Notes.SelectedNoteController = Ember.ObjectController.extend

  contentBinding: 'notesController.selectedNote',
  notesController: null

Notes.NotesView = Ember.View.extend

  elementId: 'notes'
  classNames: ['azureBlueBackground','azureBlueBorderThin']

Notes.NoteListView = Ember.View.extend

  elementId: "noteList"
  templateName: "noteList"

Notes.NoteListItemView = Ember.View.extend

  templateName: "noteListItem"
  classNames: ['pointer', 'noteListItem']

  classNameBindings: 'isSelected'
  isSelected: (->
    this.get('controller.selectedNote.name') ==
    this.get('content.name')).property 'controller.selectedNote.name'

  click: ->
    this.get( 'controller' ).set 'selectedNote', this.get( 'content' )

Notes.SelectedNoteView = Ember.View.extend

  elementId: 'selectedNote',
  templateName: 'selectedNoteTemplate'

exports.Notes = Notes

