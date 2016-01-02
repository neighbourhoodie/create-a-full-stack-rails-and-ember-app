/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'relationship',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },

    torii: {
      providers: {
        'google-oauth2': {
          redirectUri: 'http://localhost:4200/oauth2callback',
          apiKey: process.env.GOOGLE_CLIENT_ID,
        }
      }
    },

    apiHost: 'http://localhost:3000',

    contentSecurityPolicy: {
      'default-src': "'none'",
      'script-src': "'self'",
      'font-src': "'self' maxcdn.bootstrapcdn.com",
      'connect-src': "'self' http://localhost:3000/",
      'img-src': "'self'",
      'style-src': "'self' 'unsafe-inline' maxcdn.bootstrapcdn.com",
      'media-src': "'self'"
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {
    ENV.apiHost = 'https://stark-taiga-1325.herokuapp.com/api';

    ENV.torii.providers['google-oauth2'].redirectUri = 'https://stark-taiga-1325.herokuapp.com/oauth2callback';
    ENV.torii.providers['google-oauth2'].apiKey = '942171989971-orpfnmbskoef1la88r8g1j2dqdveduck.apps.googleusercontent.com';
  }

  return ENV;
};
