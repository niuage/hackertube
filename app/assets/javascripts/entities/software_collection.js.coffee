#= require ./software

@HT.module(
  "Entities",
  (Entities, ContactManager, Backbone, Marionette, $, _) ->

    @SoftwareCollection = Backbone.Collection.extend
      url: "http://api.platform.dev/software"

      model: HT.Entities.Software

      parse: (response) ->
        response.software

    softwareCollection = null

    @getSoftwareCollection = ->
      softwareCollection = new Entities.SoftwareCollection()
      defer = $.Deferred()

      softwareCollection.fetch
        reset: true
        success: (data) ->
          console.log data
          defer.resolve(data)
        error:          -> defer.resolve(undefined)

      defer.promise()
)

@HT.reqres.setHandler "software:entities", ->
  @HT.Entities.getSoftwareCollection()
