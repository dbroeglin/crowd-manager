require.config(
  baseUrl: '/assets/javascripts',
  paths: {
    jquery: 'vendor/jquery-1.9.0.min',
    underscore: 'vendor/underscore',
    backbone: 'vendor/backbone',
    marionette: 'vendor/backbone.marionette',
    stickit: 'vendor/backbone.stickit.min'
  },
  shim: {
    'marionette': {
      deps: ['backbone', 'stickit'],
      exports: 'Backbone.Marionette'
    },
    'stickit': {
      deps: ['backbone'],
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
