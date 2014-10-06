@HT.module "SoftwareApp",
  (SoftwareApp, HT, Backbone, Marionette, $, _) ->

    @Router = Marionette.AppRouter.extend
      appRoutes:
        software: "listSoftware"
        "software/:slug": "showSoftware"

    API =
      listSoftware: ->
        SoftwareApp.List.Controller.listSoftware()

      showSoftware: (slug) ->
        SoftwareApp.Show.Controller.showSoftware(slug)

    HT.addInitializer ->
      new SoftwareApp.Router(
        controller: API
      )

    HT.on "software:list", ->
      HT.navigate("software")
      API.listSoftware()

    HT.on "software:show", (slug) ->
      HT.navigate "software/#{slug}"
      API.showSoftware(slug)
