`import Ember from 'ember'`

CompanySelectComponent = Ember.Component.extend
  content: null
  selected: null

  didInitAttrs: (args...) ->
    @_super(args...)
    @set('content', []) unless @get('content')

  actions:
    change: ->
      selectedIndex = @$('select')[0].selectedIndex
      selectedValue = if selectedIndex == 0 then null else @get('content').objectAt(selectedIndex - 1)
      @set('selected', selectedValue)
      @get('action')(selectedValue)

`export default CompanySelectComponent`
