`import Ember from 'ember'`

OfferListItemComponent = Ember.Component.extend
  tagName: 'div'
  classNames: 'col-sm-12 offer-list-item'

  actions:
    addTask: ->
      console.log @get('item')

`export default OfferListItemComponent`
