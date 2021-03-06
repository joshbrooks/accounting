// Generated by CoffeeScript 1.10.0
(function() {
  var appName, modelName;

  modelName = 'project';

  appName = 'projecttracker';

  window.TransactionStore = function() {
    var self;
    riot.observable(this);
    console.log('created TransactionStore');
    self = this;
    self.transactions = [];
    self.on('transactions_fetch', function() {
      var xhr;
      xhr = $.getJSON('/transactions?format=json');
      return xhr.done(function() {
        self.transactions = xhr.responseJSON;
        return RiotControl.trigger('transactions_update', self.transactions);
      });
    });
    self.on('transactions_init', function() {
      console.log('triggered transactions_init');
      return self.trigger('transactions_changed');
    });
    return self.on('transaction_add', function(transaction) {
      self.accounts.category.push(transaction);
      return self.trigger('transactions_changed', transaction);
    });
  };

}).call(this);

//# sourceMappingURL=TransactionStore.js.map
