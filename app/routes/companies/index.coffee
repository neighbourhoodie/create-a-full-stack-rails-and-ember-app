`import Ember from 'ember'`

CompaniesIndexRoute = Ember.Route.extend
  model: -> @store.findAll('company')

`export default CompaniesIndexRoute`
