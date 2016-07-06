modelName = 'project'
appName = 'projecttracker'


window.TransactionStore = () ->

  riot.observable(this)
  console.log 'created TransactionStore'
  self = this
  self.transactions = []
  self.on 'transactions_fetch', () ->
    # TODO: Make an HTTP request to get latest accounts

    self.transactions = [
        {
            from_account: 'ANZ Bank'
            to_account: 'Mandiri'
            name: 'My transaction'
            description: 'Description'
            time: '2017-08-02 22:54'
            amt: '20.53'
        },
        {
            from_account: 'ANZ Bank'
            to_account: 'Mandiri'
            name: 'My transaction'
            description: 'Description'
            time: '2017-08-02 22:54'
            amt: '20.53'
        }
    ]
    RiotControl.trigger('transactions_update')

    xhr = $.getJSON('/transactions')
    xhr.done () ->
      self.store.transactions = xhr.responseJSON
      RiotControl.trigger('transactions_update')

  self.on 'transactions_init', () ->
    console.log 'triggered transactions_init'
    self.trigger 'transactions_changed'

  self.on 'transaction_add', (transaction) ->
    self.accounts.category.push(transaction)
    self.trigger 'transactions_changed', transaction
