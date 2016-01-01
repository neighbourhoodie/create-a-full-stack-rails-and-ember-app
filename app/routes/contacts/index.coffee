`import Ember from 'ember'`

ContactsIndexRoute = Ember.Route.extend
  model: -> @store.findAll('contact')

`export default ContactsIndexRoute`
