`import DS from 'ember-data'`

Task = DS.Model.extend
  description: DS.attr 'string'
  status: DS.attr 'string'
  dueAt: DS.attr 'date'

  offer: DS.belongsTo 'offer'
  project: DS.belongsTo 'project'

  isComplete: Ember.computed.equal('status', 'completed')

`export default Task`
