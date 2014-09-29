@App = {}

class Application
  constructor: ->
    @software_collection_view = new App.SoftwareCollectionView()
    @search_input_view = new App.SearchInputView()

    @software_collection_view.update()

@App.Application = Application
