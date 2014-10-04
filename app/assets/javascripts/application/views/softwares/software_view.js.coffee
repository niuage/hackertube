@HT.SoftwareView = Marionette.ItemView.extend
  template: JST["templates/software/software"]

  serializeData: ->
    @model.toViewAttributes()
