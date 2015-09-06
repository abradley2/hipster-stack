class Article extends Backbone.View
  template: require './article.jade'
  el: '#main-content-container'

  initialize: ->

    return

  render: ->
    @setElement @el
    @$el.html @template()
    ko.cleanNode @el
    ko.applyBindings {}, @el
    return

  remove: ->
    ko.cleanNode @el
    @undelegateEvents()
    @unbind()
    @stopListening()
    @$el.empty()
    return

module.exports = Article
