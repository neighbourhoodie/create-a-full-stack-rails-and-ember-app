`import Ember from 'ember'`

TaskListComponent = Ember.Component.extend
  items: null

  activeItems: Ember.computed.filterBy('items', 'isComplete', false)
  completedItems: Ember.computed.filterBy('items', 'isComplete', true)
  newTask: Ember.computed.filterBy('items', 'isNew')

  isEditing: (->
    @get('editingTask') || @get('newTask')
  ).property('editingTask', 'newTask.[]')

  actions:
    editTask: (task) ->
      @get('editingTask').set('isEditing', false) if @get('editingTask')
      task.set('isEditing', true)
      @set('editingTask', task)

    revertTaskDescription: ->
      task = @get('editingTask') || @get('newTask.firstObject')
      task.set('isEditing', false)
      task.rollbackAttributes()
      @set('editingTask', null)

    updateTaskDescription: ->
      task = @get('editingTask') || @get('newTask.firstObject')
      task.set('isEditing', false)
      if Ember.isEqual(task.get('description'), '') then task.rollbackAttributes() else task.save()
      @set('editingTask', null)

    updateTask: (task) ->
      task.set('status', if task.get('isComplete') then 'active' else 'completed')
      task.save()

    addTask: ->
      if @get('editingTask')
        @get('editingTask').set('isEditing', false)
        @get('editingTask').rollbackAttributes()
        @set('editingTask', null)
      @sendAction 'onAddTask'

`export default TaskListComponent`
