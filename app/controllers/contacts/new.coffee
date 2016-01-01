`import Ember from 'ember'`

ContactsNewController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'contacts.show', @get('model')

    cancel: -> @transitionToRoute 'contacts.show', @get('model')

`export default ContactsNewController`
