class Bdemo.Routers.VisitorsRouter extends Backbone.Router
  initialize: (options) ->
    @visitors = new Bdemo.Collections.VisitorsCollection()
    @visitors.reset options.visitors

  routes:
    "new"      : "newVisitor"
    "index"    : "index"
  #  ":id/edit" : "edit"
  #  ":id"      : "show"
    ".*"        : "index"
    

  newVisitor: ->
    @view = new Bdemo.Views.Visitors.NewView(collection: @visitors)
    $("#book-tour").html(@view.render().el)

  index: ->
    @view = new Bdemo.Views.Visitors.IndexView(visitors: @visitors)
    #$("#listings").html(@view.render().el)

  show: (id) ->
    listing = @listings.get(id)

    @view = new Bdemo.Views.Visitors.ShowView(model: listing)
    $(".modal-body").html(@view.render().el)
    $('#myModal').modal('show')

  edit: (id) ->
    listing = @listings.get(id)

    @view = new Bdemo.Views.Visitors.EditView(model: listing)
    $(".modal-body").html(@view.render().el)
    print_country("country")
    $("#country").val(listing.get("country"))
    $("#state").val(listing.get("state"))
    console.log("vale is ....."+listing.get("state") )
    $('#myModal').modal('show')

