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

    unique = newNoteName != null and newNoteName.length > 1

    content.forEach (note)->
      if newNoteName == note.get 'name'
        unique = false

    if not unique
      alert "Note shuld be unique"
      return

    content.pushObject Ember.Object.create
      name: newNoteName
      value: ""

    this.set 'newNoteName', null

  doDeleteNote: ->

    $( "#confirmDeleteConfirmDialog" ).modal show:true

  deleteSelectedNote: ->

    selectedNote = this.get "selectedNote"

    if selectedNote

      this.get( 'content' ).removeObject selectedNote
      this.set 'selectedNote', null

  doConfirmDelete: ->

    @deleteSelectedNote()
    $( "#confirmDeleteConfirmDialog" ).modal 'hide'

  doCancelDialog: ->

    $( "#confirmDeleteConfirmDialog" ).modal 'hide'


Notes.TextField = Ember.TextField.extend Ember.TargetActionSupport,
  
  insertNewline: -> this.triggerAction()
  classNames: ['notes-edit']

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

Notes.ConfirmDialogView = Ember.View.extend

  templateName: 'confirmDialog'
  classNames: ['modal', 'hide']

  cancelButtonLabel: "Cancel"
  okButtonLabel: "OK"

  okAction: ->
    console.log "OK"

  cancelAction: null

Notes.BootstrapButton = Ember.View.extend Ember.TargetActionSupport,

  tagName: 'button'
  classNames: ['button']
  disabled: false

  click: ->
    if not this.get 'disabled'
      this.triggerAction()

  templateName:'bootstrapButton'

  okAction: ->
    console.log "Yep"

Notes.Duration = Ember.Object.extend

  durationSeconds: 0

  durationString: ((key, value) ->

    if arguments.length == 2 and value
      valueParts = value.split( ":" )

      if valueParts.length == 3
        duration = (valueParts[0]*60*60) + valueParts[1] * 60 +
          valueParts[2] * 1
        this.set 'durationSeconds', duration

    duration = this.get 'durationSeconds'

    hours = Math.floor durarion/3600
    minutes = Math.floor (duration - hours * 3600)/60
    seconds = Math.floor (durarion - minutes * 60 - hours * 3600)

    ("0" + hours).slice(-2) + ":" + ("0" + minutes).slice(-2) +
      ("0" + seconds).slice(-2)).property( 'durationSeconds').cacheable()
   
exports.Notes = Notes

