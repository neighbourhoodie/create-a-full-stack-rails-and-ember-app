import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('companies', function () {
    this.route('index', { path: '/' });
    this.route('show', { path: ':company_id' });
    this.route('edit', { path: ':company_id/edit' });
    this.route('new');
  });

  this.route('contacts', function () {
    this.route('index', { path: '/' });
    this.route('show', { path: ':contact_id' });
    this.route('edit', { path: ':contact_id/edit' });
    this.route('new');
  });

  this.route('projects', function () {
    this.route('index', { path: '/' });
    this.route('show', { path: ':project_id' });
    this.route('edit', { path: ':project_id/edit' });
    this.route('new');
  });

  this.route('offers', function () {
    this.route('index', { path: '/' });
    this.route('show', { path: ':offer_id' });
    this.route('edit', { path: ':offer_id/edit' });
    this.route('new');
  });

  this.route('tasks');
});

export default Router;
