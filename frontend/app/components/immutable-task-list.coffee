`import Ember from 'ember'`

TaskListComponent = Ember.Component.extend
  tagName: 'ul'
  classNames: 'list-unstyled'

  showCompleted: true
  items: null
  updatedItems: []

  didInitAttrs: ->
    @set('updatedItems', @get('items'))

  updateItems: (->
    Ember.run.debounce(@, (->
      @set('updatedItems', @get('items'))
    ), 1000)
  ).observes('items')

  activeItems: (->
    @get('updatedItems').filterBy('isComplete', false)
  ).property('updatedItems')

  completedItems: (->
    @get('updatedItems').filterBy('isComplete', true)
  ).property('updatedItems')

  actions:
    updateTask: (task) ->
      task.set('status', if task.get('isComplete') then 'active' else 'completed')
      task.save()

`export default TaskListComponent`
