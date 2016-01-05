`import Ember from 'ember'`

CompaniesNewController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'companies.show', @get('model')

    cancel: -> @transitionToRoute 'companies.show', @get('model')

`export default CompaniesNewController`
