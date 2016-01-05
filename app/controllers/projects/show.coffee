`import Ember from 'ember'`

ProjectsShowController = Ember.Controller.extend
  newNoteType: 'general-note'
  newNoteTitle: ''
  newNoteDescription: ''
  newNoteContact: null

  noteTypeAllowsContacts: (->
    !(@get('newNoteType') == undefined || @get('newNoteType') == 'general-note')
  ).property('newNoteType')

  notesByNewest: (->
    Ember.ArrayProxy.create(content: @get('model.notes')).sortBy('createdAt').reverseObjects()
  ).property('model.notes')

  actions:
    changeNoteType: ->
      @set('newNoteType', Ember.$('select#change_note_type').val())

    deleteNote: (note) -> note.destroyRecord()

    addNote: ->
      note = @store.createRecord @get('newNoteType'),
        title: @get('newNoteTitle')
        description: @get('newNoteDescription')
        contact: @get('newNoteContact')
        topic: @get('model')
      note.save().then (note) =>
        @get('model.notes').pushObject(note)
        @set('newNoteType', 'general-note')
        @set('newNoteTitle', '')
        @set('newNoteDescription', '')
        @set('newNoteContact', null)
        Ember.$('select#change_note_type').val('general-note')

    addTask: ->
      @store.createRecord('task', project: @model, isEditing: true)

    delete: (model) ->
      model.destroyRecord().then =>
        @transitionToRoute 'companies.index'

`export default ProjectsShowController`
