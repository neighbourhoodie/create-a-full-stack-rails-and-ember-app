`import Ember from 'ember'`

CollectionSelectComponent = Ember.Component.extend
  content: []
  selected: null
  emptyValueDescription: null

  didInitAttrs: ->
    unless @get('emptyValueDescription') || Ember.isEmpty(@get('selected'))
      selectedValue = @get('content.firstObject')
      @set('selected', selectedValue)
      @get('action')(selectedValue)

  actions:
    change: ->
      console.log "CHANGE"
      selectedIndex = @$('select')[0].selectedIndex
      selectedValue = if @get('emptyValueDescription')
        if selectedIndex == 0 then null else @get('content').objectAt(selectedIndex - 1)
      else
        @get('content').objectAt(selectedIndex)
      @set('selected', selectedValue)
      @get('action')(selectedValue)

`export default CollectionSelectComponent`
