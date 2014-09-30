@App.SoftwareCollectionView = Backbone.View.extend
  el: "#software-gallery"

  initialize: ->
    @software_collection = new App.SoftwareCollection()
    @listenTo @software_collection, "reset", @render

    @listenTo App.er, "search", @update

  update: (query, page) ->
    console.log query
    @software_collection.fetch
      reset: true
      data:
        query: @query(query)
        page: page || 1

  query: (query) ->
    query ||= ""
    "has:video #{query}"

  render: ->
    @reset()
    @software_collection.each _.bind(@renderSoftware, @)

  renderSoftware: (software) ->
    view = new App.SoftwareView(model: software, collection: @)
    @$el.append view.render().el

  reset: ->
    @$el.empty()
