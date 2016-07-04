modelName = 'project'
appName = 'projecttracker'


window.TransactionStore = (transactions) ->

  riot.observable @
  @transactions = transactions || []
  @edit = {} # Store the Person currently being edited
  @filters = ''

  ### Request the latest projects from DRF ###
  @on 'transaction_list_load', (opts)->
    opts = opts or {}
    page = opts.page or 1
    per_page = opts.per_page or 100
    filters = opts.filters or ''
    self.filters = filters
    # TODO: Patch up and Implement the "RequestStore" mechanics from onlineoffline

  @on 'ping', ->
    alert 'ping'

  @on 'tag_selected', (e) ->
    console.log e
