@HT = new Marionette.Application()

@HT.addRegions
  main: "[data-region=main]"
  header: "[data-region=header]"

@HT.on "start", (options) ->
  Backbone.history.start(pushState: true)

  softwareCollection = new HT.Entities.SoftwareCollection()

  softwareCollectionView = new HT.SoftwareCollectionView
    collection: softwareCollection

  @main.show(softwareCollectionView)

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
