HT.module "SoftwareApp.Show",
  (Show, HT, Backbone, Marionette, $, _) ->

    @Controller =
      showSoftware: (slug) ->
        modelRequest = HT.request("software:entity", slug)

        $.when(modelRequest).done (software) ->
          softwareView = new Show.Software(model: software)
          HT.mainRegion.show(softwareView)


