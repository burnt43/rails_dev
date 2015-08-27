App.PostEditRoute = Ember.Route.extend({
  activate: function () { 
    this.controllerFor('post').set('isEditing',true)
  },
  deactivate: function () {
    this.controllerFor('post').set('isEditing',false)
  }
});
