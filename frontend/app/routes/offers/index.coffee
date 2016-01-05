`import Ember from 'ember'`

OffersIndexRoute = Ember.Route.extend
  model: -> @store.findAll('offer')

`export default OffersIndexRoute`
