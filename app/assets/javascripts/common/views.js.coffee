@HT.module "Common.Views",
  (Views, HT, Backbone, Marionette, $, _) ->

    @Loading = Marionette.ItemView.extend
      template: JST["templates/common/loading"]

      onShow: ->
        $("#spinner").spin({})
