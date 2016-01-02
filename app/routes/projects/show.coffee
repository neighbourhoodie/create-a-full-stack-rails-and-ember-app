`import Ember from 'ember'`

ProjectsShowRoute = Ember.Route.extend
  model: (params) -> @store.findRecord('project', params.project_id)

`export default ProjectsShowRoute`
