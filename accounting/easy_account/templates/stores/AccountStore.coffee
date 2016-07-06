window.AccountStore = () ->
  riot.observable(this)
  console.log 'created AccountStore' if JS_LOG_LEVEL < 2
  self = this
  self.accounts = []
  self.on 'accounts_fetch', () ->
    # TODO: Make an HTTP request to get latest accounts

    xhr = $.getJSON('/accounts')
    xhr.done () ->
      self.accounts = xhr.responseJSON
      RiotControl.trigger('accounts_update')

  self.on 'accounts_init', () ->
      console.log 'triggered accounts_init' if JS_LOG_LEVEL < 2
      self.trigger 'accounts_changed', self.accounts
  self.on 'account_add', (account, category) ->
    self.accounts.category.push(account)
    self.trigger 'accounts_changed', accounts