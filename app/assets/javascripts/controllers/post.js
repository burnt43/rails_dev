App.PostController = Ember.ObjectController.extend({
  isEditing: false,
  showUnsavedMessage: function() {
    return this.get('model.hasDirtyAttributes') && !this.get('model.isSaving')
  }.property('model.hasDirtyAttributes','model.isSaving'),
  actions: {
    saveChanges: function () {
      this.get('model').save();
    },
    destroy: function () {
      var self = this;
      this.get('model').destroyRecord().then( function () {
        self.transitionToRoute('posts');
      });
    }
  }
});
