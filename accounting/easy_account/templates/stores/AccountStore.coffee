accounts = capital: [
  {
    name: 'ANZ'
    currency: 'USD'
    openingbalance: 10.10
    estimatedbalance: 10.10
  }
  {
    name: 'ANZ'
    currency: 'USD'
    openingbalance: 10.10
    estimatedbalance: 10.10
  }
]

window.AccountStore = () ->
  riot.observable(this)
  console.log 'created AccountStore' if JS_LOG_LEVEL < 2
  self = this
  self.accounts = accounts
  console.log accounts
  self.on 'accounts_init', () ->
      console.log 'triggered accounts_init' if JS_LOG_LEVEL < 2
      self.trigger 'accounts_changed', self.accounts
  self.on 'account_add', (account, category) ->
    self.accounts.category.push(account)
    self.trigger 'accounts_changed', accounts

window.accountstore = AccountStore()
RiotControl.addStore(window.accountstore)
RiotControl.trigger('accounts_changed')
