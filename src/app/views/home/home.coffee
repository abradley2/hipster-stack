class HomeView extends Backbone.View
  template: require './home.jade'
  el: '#content-region'

  initialize: ->
    # always reset element on initialization in case the layout has been switched
    @setElement @el
    return

  render: ->
    @$el.html @template()
    return

  remove: ->
    @$el.empty()
    @stopListening()
    @unbind()
    return

module.exports = HomeView
