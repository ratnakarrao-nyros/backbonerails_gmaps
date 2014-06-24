Bdemo.Views.Listings ||= {}

class Bdemo.Views.Listings.ListingView extends Backbone.View
  template: JST["backbone/templates/listings/listing"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
