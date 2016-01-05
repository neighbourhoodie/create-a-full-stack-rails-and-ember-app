`import Ember from 'ember'`

OffersIndexController = Ember.Controller.extend
  actions:
    addTask: (offer) ->
      @store.createRecord('task', offer: offer, isEditing: true)

`export default OffersIndexController`
