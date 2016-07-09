riot.tag2('account-transactions', '<div> <div class="c-card c-card--higher"> <div class="c-card__content c-card__content--divider heading">Transactions</div> <div class="c-card__item" each="{transaction in store.transactions}"> <div class="o-grid"> <div class="o-grid__cell o-grid__cell--width-20">{transaction.from_account.name}</div> <div class="o-grid__cell o-grid__cell--width-30"> {transaction.to_account.name} </div> <div class="o-grid__cell o-grid__cell--width-20">{transaction.name}</div> <div class="o-grid__cell o-grid__cell--width-20">{transaction.description}</div> <div class="o-grid__cell o-grid__cell--width-20">{transaction.time}</div> <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span> {transaction.amt} </div> <div class="o-grid__cell o-grid__cell--width-10"> <span> <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button> <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button> </span> </div> </div> </div> </div> </div>', 'account-transactions .menu,[riot-tag="account-transactions"] .menu,[data-is="account-transactions"] .menu{ position: absolute; }', 'class="o-grid__cell o-grid__cell--width-60"', function(opts) {
var self;

self = this;

self.store = new TransactionStore();

window.transactionstore = self.store;

RiotControl.addStore(self.store);

self.on('mount', function() {
  RiotControl.trigger('transactions_fetch');
  self.update();
  return RiotControl.on('transactions_update', function() {
    console.log('update');
    return self.update();
  });
});

self.edit_transaction = function(e) {};

self.select_transaction = function(e) {};
});
