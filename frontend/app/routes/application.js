import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin, {
  model: function () {
    return Ember.RSVP.hash({
      tasks: (this.get('session.isAuthenticated') ? this.store.findAll('task') : [])
    });
  },

  setupController: function (controller, model) {
    this._super(controller, model);
    controller.set('tasks', model.tasks);
  }
});
