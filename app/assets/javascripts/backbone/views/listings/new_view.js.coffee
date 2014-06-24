Bdemo.Views.Listings ||= {}

class Bdemo.Views.Listings.NewView extends Backbone.View
  template: JST["backbone/templates/listings/new"]

  events:
    "submit #new-listing": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () =>
      this.render()
    )
    

 
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (listing) =>
        @model = listing
        $("#myModal").modal("hide")
        window.location.hash = "#/index"

      error: (listing, error) =>
        console.log("Errro came")
    )


  render: ->
    @$el.html(@template(@model.toJSON() ))

    @$('#new-listing').validate
      rules:
        title: 'required'
        owner: 'required'
        rent : 'required'
        contact : 'required'
        location : 'required'
        country : 'required'
        state : 'required'
      

    this.$("form").backboneLink(@model)

    return this


