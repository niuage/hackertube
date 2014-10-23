#
#
#
# OLD and mostly unused
#
#
#

@HT.SearchInputView = Backbone.View.extend
  el: "[data-search=query]"

  events:
    "keyup": "onChange"

  initialize: ->
    @$form = @$el.closest("form")
    @$form.on "submit", -> false

  onChange: (e) ->
    return @submit() if @enterKeyPressed?(e)
    HT.er.trigger("search", @query(), @page())
    # @trigger("change", @serializedData())

  submit: ->
    HT.router.navigate "search/#{@query()}",
      trigger: true

  serializedData: ->
    query: @query()

  val: (val = null) ->
    if val?
      @$el.val(val)
      @trigger("valueChange", @serializedData())
    else
      @$el.val()

  query: -> @val()

  page: -> 1

  enterKeyPressed: (e) -> e.which == keyCodes["ENTER"]

keyCodes =
  ENTER: 13
  UP: 38
  DOWN: 40
  LEFT: 37
  RIGHT: 39
  ESC: 27
  CTRL: 17
  CMD: 91
  OPT: 18
  S_KEY: 83
