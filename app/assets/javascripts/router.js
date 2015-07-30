// For more information see: http://emberjs.com/guides/routing/

App.Router = Ember.Router.extend({
  location: 'auto',
  rootURL: '/emberjs/'
});

App.Router.map(function() {
  this.resource('posts', { path: '/posts' }, function () {
    this.resource('post', { path: '/post/:id' }, function () {
      this.route('edit');
    });
  });
  this.route('events');
});

