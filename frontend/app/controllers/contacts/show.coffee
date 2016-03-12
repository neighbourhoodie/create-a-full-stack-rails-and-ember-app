`import Ember from 'ember'`

ContactsShowController = Ember.Controller.extend
  actions:
    delete: (model) ->
      model.destroyRecord().then =>
        @transitionToRoute 'contacts.index'

`export default ContactsShowController`
