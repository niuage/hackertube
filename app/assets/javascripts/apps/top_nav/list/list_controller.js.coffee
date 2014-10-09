@HT.module "TopNavApp.List",
  (List, HT, Backbone, Marionette, $, _) ->

    @Controller =
      listTopNav: ->
        links = HT.request("topNav:entities")

        topNav = new List.TopNav
          collection: links

        HT.topNavRegion.show(topNav)
