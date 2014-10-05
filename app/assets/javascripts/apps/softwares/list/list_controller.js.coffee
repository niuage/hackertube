@HT.module "SoftwareApp.List",
  (List, HT, Backbone, Marionette, $, _) ->

    @Controller =

      listSoftware: ->
        softwareListView = new List.Softwares
          collection: HT.request("software:entities")

        HT.mainRegion.show(softwareListView)
