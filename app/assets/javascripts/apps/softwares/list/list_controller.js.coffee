@HT.module "SoftwareApp.List",
  (List, HT, Backbone, Marionette, $, _) ->

    @Controller =

      listSoftware: ->
        softwares = HT.request("software:entities")

        softwareListView = new List.Softwares { collection: softwares }

        softwareListView.on "childview:software:show", (childView, model) ->
          HT.SoftwareApp.Show.Controller.showSoftware(model)

        HT.mainRegion.show(softwareListView)
