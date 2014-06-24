class Bdemo.Routers.ListingsRouter extends Backbone.Router
  initialize: (options) ->
    @listings = new Bdemo.Collections.ListingsCollection()
    @listings.reset options.listings

  routes:
    "new"      : "newListing"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"
    

  newListing: ->
    @view = new Bdemo.Views.Listings.NewView(collection: @listings)
    $(".modal-body").html(@view.render().el)
    print_country("country")
    $('#myModal').modal('show')

  index: ->
    @view = new Bdemo.Views.Listings.IndexView(listings: @listings)
    $("#listings").html(@view.render().el)

  show: (id) ->
    listing = @listings.get(id)

    @view = new Bdemo.Views.Listings.ShowView(model: listing)
    $(".modal-body").html(@view.render().el)
    $('#myModal').modal('show')

  edit: (id) ->
    listing = @listings.get(id)

    @view = new Bdemo.Views.Listings.EditView(model: listing)
    $(".modal-body").html(@view.render().el)
    print_country("country")
    $("#country").val(listing.get("country"))
    $("#state").val(listing.get("state"))
    console.log("vale is ....."+listing.get("state") )
    $('#myModal').modal('show')

