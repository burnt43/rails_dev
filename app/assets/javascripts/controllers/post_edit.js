App.PostEditController = Ember.ObjectController.extend({

  showUnsavedMessage: function () {
    return this.get('model.hasDirtyAttributes') && !this.get('model.isSaving');
  }.property('model.hasDirtyAttributes','model.isSaving'),

  actions: {
    saveChanges: function () {
      var self = this
      this.get('model').save().then( function () {
        self.transitionToRoute('post');
      });
    },
    cancel: function () {
      this.get('model').rollback();
      this.transitionToRoute('post');
    }
  }
});
