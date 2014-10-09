@HT.module "Entities",
  (Entities, HT, Backbone, Marionette, $, _) ->

    @Software = Backbone.Model.extend
      defaults:
        tagline: ""

      idAttribute: "slug"

      url: ->
        "http://api.platform.dev/#{@softwarePath()}"

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

      softwarePath: ->
        "/software/" + @get("slug")

      toViewAttributes: ->
        _.extend(
          {
            video_thumbnail: @thumbnailVideo(),
            video_thumbnail_hq: @thumbnailVideoHQ(),
            software_url: @softwarePath()
          },
          @toJSON()
        )

      parse: (response) ->
        return response.software if response.software
        response

    @FeaturedSoftware = @Software.extend
      softwarePath: ->
        "/software/likeapro"

    @getSoftware = (slug) ->
      software = new Entities.Software(slug: slug)
      defer = $.Deferred()

      software.fetch
        success: (data) -> defer.resolve(data)
        error:          -> defer.resolve(undefined)

      defer.promise()

    @getFeaturedSoftware = (slug) ->
      software = new Entities.FeaturedSoftware()
      defer = $.Deferred()

      software.fetch
        success: (data) -> defer.resolve(data)
        error:          -> defer.resolve(undefined)

      defer.promise()

@HT.reqres.setHandler "software:entity", (slug) ->
  @HT.Entities.getSoftware(slug)

@HT.reqres.setHandler "software:featured:entity", ->
  @HT.Entities.getFeaturedSoftware()
