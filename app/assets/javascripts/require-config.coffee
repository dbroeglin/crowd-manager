require.config(
  baseUrl: '/assets/javascripts',
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
)

require ['crowd_manager'], (CrowdManager) ->
  CrowdManager.start()
