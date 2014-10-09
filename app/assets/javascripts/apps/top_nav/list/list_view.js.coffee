@HT.module "TopNavApp.List",
  (List, HT, Backbone, Marionette, $, _) ->

    @TopNavItem = Marionette.ItemView.extend
      template: JST["templates/top_nav/top_nav_link"]
      tagName: "li"

    @TopNav = Marionette.CompositeView.extend
      template: JST["templates/top_nav/top_nav"]
      itemView: List.TopNavItem
      itemViewContainer: ".top-menu"

      onShow: -> console.log "lol"
