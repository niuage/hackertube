@App = {}

class Application
  constructor: ->
    @softwareCollectionView = new App.SoftwareCollectionView()
    @searchInputView = new App.SearchInputView()

    @captureLinks()

  @start: ->
    new Application().start()
    Backbone.history.start pushState: true

  start: ->
    @softwareCollectionView.update(@searchInputView.query())

  captureLinks: ->
    $("body").on "click", "a[href^='/']", (e) ->
      href = $(e.currentTarget).attr('href')

      # Add condition here to not capture links like Sign out later
      passThrough = false

      if !passThrough && !e.altKey && !e.ctrlKey && !e.metaKey && !e.shiftKey
        e.preventDefault()

        url = href.replace(/^\//,'')

        # Instruct Backbone to trigger routing events
        App.router.navigate url, { trigger: true }

        return false

@App.Application = Application
