App.PostsNewRoute = Ember.Route.extend({
  
  setupController: function (controller) {
    controller.set('fields', {
      state: 'Not Important'
    });
  }

});
