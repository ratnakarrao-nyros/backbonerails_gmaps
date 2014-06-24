Bdemo.Views.Listings ||= {}

class Bdemo.Views.Listings.IndexView extends Backbone.View
  template: JST["backbone/templates/listings/index"]

  initialize: () ->
    @options.listings.bind('reset', @addAll)

  addAll: () =>
    @options.listings.each(@addOne)

  addOne: (listing) =>
    view = new Bdemo.Views.Listings.ListingView({model : listing})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(listings: @options.listings.toJSON() ))
    @addAll()

    return this

