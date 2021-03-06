// Generated by CoffeeScript 1.10.0
(function() {
  window.AccountStore = function() {
    var self;
    riot.observable(this);
    self = this;
    self.accounts = [];
    self.on('accounts_fetch', function() {
      var xhr;
      xhr = $.getJSON(Urls['accounts:accounts']());
      return xhr.done(function() {
        self.accounts = xhr.responseJSON;
        console.log('triggering accounts_changed');
        return self.trigger('accounts_changed', self.accounts);
      });
    });
    return self.on('account_add', function(account, category) {
      self.accounts.category.push(account);
      return self.trigger('accounts_changed', self.accounts);
    });
  };

}).call(this);

//# sourceMappingURL=AccountStore.js.map
