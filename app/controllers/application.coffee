`import Ember from 'ember'`

ApplicationController = Ember.Controller.extend
  session: Ember.inject.service()

  actions:
    login: ->
      @get('session').authenticate('authenticator:google', 'google')
    logout: ->
      @get('session').invalidate()

`export default ApplicationController`
