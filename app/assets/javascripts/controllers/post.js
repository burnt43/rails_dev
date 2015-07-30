App.PostController = Ember.ObjectController.extend({
  showUnsavedMessage: function() {
    return this.get('isDirty') && !this.get('isSaving')
  }.property('isDirty','isSaving'),
  actions: {
    saveChanges: function () {
      this.get('model').save();
    }
  }
});
