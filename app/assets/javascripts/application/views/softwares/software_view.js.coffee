#= require "application/templates/software"

@App.SoftwareView = Backbone.View.extend
  template: JST["application/templates/software"]

  render: ->
    @$el.html(@template(@toJSON()))
    @

  toJSON: -> @model.toViewAttributes()
