Bdemo.Views.Listings ||= {}

class Bdemo.Views.Visitors.IndexView extends Backbone.View
  template: JST["backbone/templates/visitors/index"]

  initialize: () ->
    @options.visitors.bind('reset', @addAll)

  addAll: () =>
    @options.visitors.each(@addOne)

  addOne: (visitor) =>
    view = new Bdemo.Views.Visitors.VisitorView({model : visitor})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(visitors: @options.visitors.toJSON() ))
    @addAll()

    return this

