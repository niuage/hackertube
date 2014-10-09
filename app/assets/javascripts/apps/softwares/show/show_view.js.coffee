@HT.module "SoftwareApp.Show",
  (Show, HT, Backbone, Marionette, $, _) ->

    @Software = Marionette.ItemView.extend
      template: JST["templates/software/show/software"]

      events:
        "click #video-thumbnail": "createPlayer"

      createPlayer: ->
        $("#video-thumbnail").find("img").fadeOut()

        pop = Popcorn.smart(
          "#video-thumbnail",
          @model.get("video_url")
        )

        pop.play()

      serializeData: ->
        @model.toViewAttributes()

    @FeaturedSoftware = Marionette.ItemView.extend
      template: JST["templates/software/featured/software"]
