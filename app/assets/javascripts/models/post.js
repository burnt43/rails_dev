App.Post = DS.Model.extend({
  title: DS.attr('string'),
  state: DS.attr('string'),
  body:  DS.attr('string')
});
App.Post.reopenClass({
  STATES: ['Not Important','Important']
});
