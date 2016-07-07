modelName = 'project'
appName = 'projecttracker'


window.TransactionStore = () ->

  riot.observable(this)
  console.log 'created TransactionStore'
  self = this
  self.transactions = []
  self.on 'transactions_fetch', () ->

    xhr = $.getJSON('/transactions?format=json')
    xhr.done () ->
      self.transactions = xhr.responseJSON
      RiotControl.trigger('transactions_update')

  self.on 'transactions_init', () ->
    console.log 'triggered transactions_init'
    self.trigger 'transactions_changed'

  self.on 'transaction_add', (transaction) ->
    self.accounts.category.push(transaction)
    self.trigger 'transactions_changed', transaction
