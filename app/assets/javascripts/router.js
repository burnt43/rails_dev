// For more information see: http://emberjs.com/guides/routing/

App.Router = Ember.Router.extend({
  location: 'auto',
  rootURL: '/emberjs/'
});

App.Router.map(function() {
  this.route('posts');
  this.route('events');
});

