App.PostsNewController = Ember.Controller.extend({

  actions: {
    createPost: function () {
      var self = this;
      var post = this.store.createRecord('post', this.get('fields'));
      post.save().then( function () {
        self.transitionToRoute('post',post);
      });
    }
  }

});
