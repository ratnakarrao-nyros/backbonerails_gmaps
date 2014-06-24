Bdemo.Views.Visitors ||= {}

class Bdemo.Views.Visitors.NewView extends Backbone.View
  template: JST["backbone/templates/visitors/new"]

  events:
    "submit #new-visitor": "save"

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
      success: (visitor) =>
        @model = visitor
        #$("#myModal").modal("hide")
        #window.location.hash = "#/index"

      error: (visitor, error) =>
        console.log("Errro came")
    )


  render: ->
    @$el.html(@template(@model.toJSON() ))

    @$('#new-visitor').validate
      rules:
        name: 'required'
        start: 'required'
        end: 'required'
        place : 'required'
        

    this.$("form").backboneLink(@model)

    return this


