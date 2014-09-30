@App.Router = Backbone.Router.extend

  routes:
    "search/:query": "search"

  search: (query) ->
    App.er.trigger("search", query)

@App.router = new @App.Router()

Backbone.history.start
  pushState: true
