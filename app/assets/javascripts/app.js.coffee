@App = {}

class Application
  constructor: ->
    @softwareCollectionView = new App.SoftwareCollectionView()
    @searchInputView = new App.SearchInputView()

  @start: ->
    new Application().start()

  start: ->
    @softwareCollectionView.update(@searchInputView.query())

@App.Application = Application
