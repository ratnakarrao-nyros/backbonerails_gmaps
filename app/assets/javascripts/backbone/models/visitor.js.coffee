class Bdemo.Models.Visitor extends Backbone.Model
  paramRoot: 'visitor'

  defaults:
    name: null
    place: null
    start: null
    end: null




class Bdemo.Collections.VisitorsCollection extends Backbone.Collection
  model: Bdemo.Models.Visitor
  url: '/visitors'






