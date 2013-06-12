require.config({
  baseUrl: '../javascripts',
  paths: {
    jquery: 'vendor/jquery-1.9.0.min',
    underscore: 'vendor/underscore',
    backbone: 'vendor/backbone',
    marionette: 'vendor/backbone.marionette',
  },
  shim: {
    'marionette': {
      deps: ['backbone'],
      exports: 'Backbone.Marionette'
    },
    'backbone': {
      deps: ['underscore', 'jquery'],
      exports: 'Backbone'
    },
    'underscore': {
      exports: '_'
    },
  }
});
