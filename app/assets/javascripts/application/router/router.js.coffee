@HT.Router = Backbone.Router.extend

  routes:
    "": "home"
    "search/:query": "search"

  home:
    console.log "Router: Home"

  search: (query) ->
    console.log "Router: search"
    HT.er.trigger("search", query)

@HT.router = new @HT.Router()
