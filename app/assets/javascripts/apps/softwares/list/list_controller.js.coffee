@HT.module "SoftwareApp.List",
  (List, HT, Backbone, Marionette, $, _) ->

    @Controller =
      listSoftware: ->
        HT.headerRegion.reset()
        HT.mainRegion.show(new HT.Common.Views.Loading())

        softwaresRequest = HT.request("software:entities")

        $.when(softwaresRequest).done (softwares) ->
          softwareListView = new List.Softwares(
            collection: softwares
          )

          softwareListView.on "childview:software:show", (childView, model) ->
            HT.trigger("software:show", model.get("slug"))

          HT.mainRegion.show(softwareListView)

      indexSoftware: ->
        softwareRequest = HT.request("software:featured:entity")

        $.when(softwareRequest).done (software) ->
          softwareFeaturedView = new HT.SoftwareApp.Show.FeaturedSoftware(
            model: software
          )

          HT.headerRegion.show(softwareFeaturedView)

        @listSoftware()
