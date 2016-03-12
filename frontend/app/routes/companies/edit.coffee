`import Ember from 'ember'`

CompaniesShowRoute = Ember.Route.extend
  model: (params) -> @store.findRecord('company', params.company_id)

  deactivate: -> @get('controller.model').rollbackAttributes()

`export default CompaniesShowRoute`
