App.Post = DS.Model.extend({
  title: DS.attr('string'),
  body:  DS.attr('string'),
  color: DS.attr('string')
});
App.Post.reopenClass({
  COLORS: ['Black','White']
});
