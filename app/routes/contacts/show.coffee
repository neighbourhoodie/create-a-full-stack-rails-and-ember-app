`import Ember from 'ember'`

ContactsShowRoute = Ember.Route.extend
  model: (params) -> @store.findRecord('contact', params.contact_id)

`export default ContactsShowRoute`
