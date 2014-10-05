@HT.module "Entities",
  (Entities, HT, Backbone, Marionette, $, _) ->

    @Software = Backbone.Model.extend
      youtubeRegexp: /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/

      thumbnailVideo: (size = "mq") ->
        return unless @videoId()
        "http://img.youtube.com/vi/#{@videoId()}/#{size}default.jpg"

      thumbnailVideoHQ: ->
        @thumbnailVideo("hq")

      videoId: ->
        videoUrl = @get("video_url")
        return unless videoUrl

        match = videoUrl.match(@youtubeRegexp)
        match[7] if match && match[7].length == 11

      softwareUrl: ->
        "/project/" + @get("slug")

      toViewAttributes: ->
        _.extend(
          {
            video_thumbnail: @thumbnailVideo(),
            video_thumbnail_hq: @thumbnailVideoHQ(),
            software_url: @softwareUrl()
          },
          @toJSON()
        )
