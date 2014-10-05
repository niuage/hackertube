HT.module "SoftwareApp.Show",
  (Show, HT, Backbone, Marionette, $, _) ->

    @Controller =
      showSoftware: (model) ->
        softwareView = new Show.Software(model: model)

        HT.mainRegion.show(softwareView)


