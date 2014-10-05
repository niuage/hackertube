@HT.module "SoftwareApp.Show",
  (Show, HT, Backbone, Marionette, $, _) ->

    @Software = Marionette.ItemView.extend
      template: JST["templates/software/show/software"]
