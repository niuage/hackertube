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
        HT.execute("set:active:topNavItem", "")

      listSoftware: ->
        SoftwareApp.List.Controller.listSoftware()
        HT.execute("set:active:topNavItem", "software")

      showSoftware: (slug) ->
        SoftwareApp.Show.Controller.showSoftware(slug)
        HT.execute("set:active:topNavItem", "software")

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
