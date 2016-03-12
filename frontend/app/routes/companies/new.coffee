`import Ember from 'ember'`

CompaniesNewRoute = Ember.Route.extend
  model: -> @store.createRecord('company')

  deactivate: -> @get('controller.model').rollbackAttributes()

`export default CompaniesNewRoute`
