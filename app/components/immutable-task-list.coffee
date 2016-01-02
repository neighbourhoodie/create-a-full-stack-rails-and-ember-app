`import Ember from 'ember'`

TaskListComponent = Ember.Component.extend
  tagName: 'ul'
  classNames: 'list-unstyled'

  showCompleted: true
  items: null
  activeItems: Ember.computed.filterBy('items', 'isComplete', false)
  completedItems: Ember.computed.filterBy('items', 'isComplete', true)

  actions:
    updateTask: (task) ->
      task.set('status', if task.get('isComplete') then 'active' else 'completed')
      task.save()

`export default TaskListComponent`
