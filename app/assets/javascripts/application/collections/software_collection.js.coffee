@App.SoftwareCollection = Backbone.Collection.extend
  url: "http://api.platform.dev/software"

  model: App.Software

  parse: (response) ->
    response.software
