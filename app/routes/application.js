import Ember from 'ember';

export default Ember.Route.extend({
  session: Ember.inject.service(),

  model: function () {
    console.log(this.get('session.isAuthenticated'));

    return Ember.RSVP.hash({
      tasks: this.get('session.isAuthenticated') ? this.store.findAll('task') : []
    });
  },

  setupController: function (controller, model) {
    this._super(controller, model);
    controller.set('tasks', model.tasks);
  }
});
