require.config({
  baseUrl: '../javascripts',
  paths: {
    jquery: 'vendor/jquery-1.9.0.min',
    underscore: 'vendor/underscore',
    backbone: 'vendor/backbone',
    marionette: 'vendor/backbone.marionette',
    stickit: 'vendor/backbone.stickit.min'
  },
  shim: {
    'marionette': {
      deps: ['stickit', 'backbone'],
      exports: 'Backbone.Marionette'
    },
    'backbone': {
      deps: ['underscore', 'jquery'],
      exports: 'Backbone'
    },
    'stickit': {
      deps: ['backbone'],
    },
    'underscore': {
      exports: '_'
    },
  }
});
