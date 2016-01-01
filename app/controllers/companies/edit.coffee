`import Ember from 'ember'`

CompaniesEditController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'companies.show', @get('model')

    cancel: -> @transitionToRoute 'companies.show', @get('model')

`export default CompaniesEditController`
