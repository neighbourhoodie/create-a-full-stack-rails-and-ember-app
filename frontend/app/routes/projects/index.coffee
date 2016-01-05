`import Ember from 'ember'`

ProjectsIndexRoute = Ember.Route.extend
  model: -> @store.findAll('project')

`export default ProjectsIndexRoute`
