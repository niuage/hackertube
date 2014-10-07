@HT.module "SoftwareApp.List",
  (List, HT, Backbone, Marionette, $, _) ->

    @Controller =
      listSoftware: ->
        HT.mainRegion.show(new HT.Common.Views.Loading())

        softwaresRequest = HT.request("software:entities")

        $.when(softwaresRequest).done (softwares) ->
          softwareListView = new List.Softwares(
            collection: softwares
          )

          softwareListView.on "childview:software:show", (childView, model) ->
            HT.trigger("software:show", model.get("slug"))

          HT.mainRegion.show(softwareListView)
