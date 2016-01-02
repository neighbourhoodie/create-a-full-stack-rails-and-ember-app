`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  session: Ember.inject.service()

  actions:
    addTask: ->
      @store.createRecord('task', isEditing: true)
    login: ->
      @get('session').authenticate('authenticator:google', 'google')
    logout: ->
      @get('session').invalidate()

`export default ApplicationController`
