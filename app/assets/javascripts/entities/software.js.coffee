@HT.module "Entities",
  (Entities, HT, Backbone, Marionette, $, _) ->

    @Software = Backbone.Model.extend
      thumbnailImage: ->
        return unless @videoId()
        "http://img.youtube.com/vi/#{@videoId()}/mqdefault.jpg"

      videoId: ->
        videoUrl = @get("video_url")
        return unless videoUrl

        id = switch
          when videoUrl.match(/youtube.com\/watch\?v=/)
            videoUrl.match(/v=(.*)/)
          when videoUrl.match("youtu.be")
            videoUrl.match(/.be\/(.*)/)

        return unless id
        id[1]

      toViewAttributes: ->
        _.extend(
          { thumbnailImage: @thumbnailImage() },
          @toJSON()
        )
