@HT.module "SoftwareApp",
  (SoftwareApp, HT, Backbone, Marionette, $, _) ->

    @Router = Marionette.AppRouter.extend
      appRoutes:
        software: ""

    API =
      listSoftware: ->
        console.log "LIST SOFTWARE"

    HT.addInitializer ->
      new SoftwareApp.Router(
        controller: API
      )
