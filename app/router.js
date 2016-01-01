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
});

export default Router;
