`import Ember from 'ember'`

CompaniesShowController = Ember.Controller.extend
  actions:
    delete: (model) ->
      model.destroyRecord().then =>
        @transitionToRoute 'companies.index'

`export default CompaniesShowController`
