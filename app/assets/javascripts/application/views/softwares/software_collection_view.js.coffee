#= require ./software_view

@HT.SoftwareCollectionView = Marionette.CollectionView.extend
  childView: HT.SoftwareView

  el: "#software-gallery"

  initialize: ->
    @listenTo @collection, "reset", @render
    @update()

    @listenTo HT.er, "search", @update

  update: (query, page) ->
    console.log @collection
    @collection.fetch
      reset: true
      data:
        query: @query(query)
        page: page || 1

  query: (query) ->
    query ||= ""
    "has:video #{query}"

  # render: ->
  #   @reset()
  #   @software_collection.each _.bind(@renderSoftware, @)

  # renderSoftware: (software) ->
  #   view = new HT.SoftwareView(model: software, collection: @)
  #   @$el.append view.render().el

  # reset: ->
  #   @$el.empty()
