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
      @softwareCollection ||
        (@softwareCollection = new Entities.SoftwareCollection())

)

@HT.reqres.setHandler "software:entities", ->
  @HT.Entities.getSoftwareCollection()
