class Bdemo.Models.Listing extends Backbone.Model
  paramRoot: 'listing'

  defaults:
    title: null
    owner: null
    rent: null
    contact: null
    location: null




class Bdemo.Collections.ListingsCollection extends Backbone.Collection
  model: Bdemo.Models.Listing
  url: '/listings'






