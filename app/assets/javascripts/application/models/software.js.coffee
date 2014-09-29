@App.Software = Backbone.Model.extend
  thumbnailImage: ->
    return unless @videoId()
    "http://img.youtube.com/vi/#{@videoId()}/mqdefault.jpg"

  videoId: ->
    videUrl = @get("video_url")
    return unless videUrl
    videUrl.match(/v=(.*)/)[1]

  toViewAttributes: ->
    @toJSON()
    _.extend(
      {thumbnailImage: @thumbnailImage()},
      @toJSON()
    )
