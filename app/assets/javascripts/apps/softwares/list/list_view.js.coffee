@HT.module "SoftwareApp.List",
  (List, HT, Backbone, Marionette, $, _) ->

    # Software Item View
    @Software = Marionette.ItemView.extend
      template: JST["templates/software/software"]

      serializeData: ->
        @model.toViewAttributes()

    # Software Collection View
    @Softwares = Marionette.CollectionView.extend
      childView: List.Software

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

