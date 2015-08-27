App.PostRoute = Ember.Route.extend({
  model: function(params) { this.store.find('post',params.id) }
});
