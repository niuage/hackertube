@HT.module "Entities",
  (Entities, HT, Backbone, Marionette, $, _) ->

    @TopNav = Backbone.Model.extend
      initialize: ->
        selectable = new Backbone.Picky.Selectable(@)
        _.extend(@, selectable)

    @TopNavCollection = Backbone.Collection.extend
      model: Entities.TopNav,

      initialize: ->
        singleSelect = new Backbone.Picky.SingleSelect(@)
        _.extend(@, singleSelect)

    API =
      getTopNavEntities: =>
        @topNavEntities ||= new @TopNavCollection([
          { name: "Browse", url: "software", icon: "bars" },
          { name: "Upload", url: "#", icon: "upload" },
          { name: "Sign in", url: "#", icon: "circle-o" }
        ])

    HT.reqres.setHandler "topNav:entities", ->
      API.getTopNavEntities()
