@HT = new Marionette.Application()

@HT.addRegions
  mainRegion: "[data-region=main]"
  headerRegion: "[data-region=header]"
  topNavRegion: '[data-region="top-nav"]'

@HT.on "start", (options) ->
  Backbone.history.start(pushState: true)

@HT.navigate = (route, options) ->
  options ||= {}
  Backbone.history.navigate(route, options)

@HT.getCurrentRoute = ->
  return Backbone.history.fragment
