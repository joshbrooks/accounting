window.AccountStore = () ->
  riot.observable(this)
  self = this
  self.accounts = []

  self.on 'accounts_fetch', () ->
    xhr = $.getJSON Urls['accounts:accounts']()
    xhr.done () ->
      self.accounts = xhr.responseJSON
      console.log 'triggering accounts_changed'
      self.trigger 'accounts_changed', self.accounts

  self.on 'account_add', (account, category) ->
    self.accounts.category.push(account)
    self.trigger 'accounts_changed', self.accounts