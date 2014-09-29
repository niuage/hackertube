@App.Router = Backbone.Router.extend

  routes:
    "search": "search"

  search: ->
    console.log "hahahah"
    App.er.trigger("search", query, page)

@App.router = new @App.Router()
