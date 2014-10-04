#= require ./software

console.log HT.Entities.Software

@HT.module(
  "Entities",
  (Entities, ContactManager, Backbone, Marionette, $, _) ->

    @SoftwareCollection = Backbone.Collection.extend
      url: "http://api.platform.dev/software"

      model: HT.Entities.Software

      parse: (response) ->
        response.software
)
