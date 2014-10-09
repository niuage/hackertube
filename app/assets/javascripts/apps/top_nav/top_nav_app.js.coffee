@HT.module "TopNavApp",
  (TopNavApp, HT, Backbone, Marionette, $, _) ->

    API =
      listTopNav: ->
        TopNavApp.List.Controller.listTopNav()

    HT.commands.setHandler "set:active:topNavItem", (name) ->
      HT.TopNavApp.List.Controller.setActiveHeader(name)

    TopNavApp.on "start", ->
      API.listTopNav()
