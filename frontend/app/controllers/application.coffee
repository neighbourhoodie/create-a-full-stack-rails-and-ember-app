`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  session: Ember.inject.service()

  persistedTasks: Ember.computed.filterBy('tasks', 'isNew', false)

  actions:
    addTask: ->
      @store.createRecord('task', isEditing: true)
    login: ->
      @get('session').authenticate('authenticator:google', 'google')
    logout: ->
      @get('session').invalidate()

`export default ApplicationController`
