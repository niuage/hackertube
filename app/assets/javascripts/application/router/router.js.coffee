@App.Router = Backbone.Router.extend

  routes:
    "": "home"
    "search/:query": "search"

  home:
    console.log "Router: Home"

  search: (query) ->
    console.log "Router: search"
    App.er.trigger("search", query)

@App.router = new @App.Router()
