Bdemo.Views.Listings ||= {}

class Bdemo.Views.Listings.EditView extends Backbone.View
  template: JST["backbone/templates/listings/edit"]

  events:
    "submit #edit-listing": "update"

      
  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (listing) =>
        @model = listing
        #window.location.hash = "/#{@model.id}" 
        $("#myModal").modal("hide")
        window.location.hash = "#/index" 

      error: (model,response,options) => 
        $("#error").html(JSON.parse(response))
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this


