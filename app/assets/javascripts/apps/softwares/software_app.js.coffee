@HT.module "SoftwareApp",
  (SoftwareApp, HT, Backbone, Marionette, $, _) ->

    @Router = Marionette.AppRouter.extend
      appRoutes:
        "": "indexSoftware"
        software: "listSoftware"
        "software/:slug": "showSoftware"

    API =
      indexSoftware: ->
        SoftwareApp.List.Controller.indexSoftware()

      listSoftware: ->
        SoftwareApp.List.Controller.listSoftware()

      showSoftware: (slug) ->
        SoftwareApp.Show.Controller.showSoftware(slug)

    HT.addInitializer ->
      new SoftwareApp.Router(
        controller: API
      )

    HT.on "software:index", ->
      HT.navigate("")
      API.indexSoftware()

    HT.on "software:list", ->
      HT.navigate("software")
      API.listSoftware()

    HT.on "software:show", (slug) ->
      HT.navigate "software/#{slug}"
      API.showSoftware(slug)
