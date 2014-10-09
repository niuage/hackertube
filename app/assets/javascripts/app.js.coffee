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

# @Application.on "before:start", ->
#   # capture links
#   $("body").on "click", "a[href^='/']", (e) ->
#     href = $(e.currentTarget).attr('href')

#     # Add condition here to not capture links like Sign out later
#     passThrough = false

#     if !passThrough && !e.altKey && !e.ctrlKey && !e.metaKey && !e.shiftKey
#       e.preventDefault()

#       url = href.replace(/^\//,'')

#       # Instruct Backbone to trigger routing events
#       HT.router.navigate url, { trigger: true }

#       return false
