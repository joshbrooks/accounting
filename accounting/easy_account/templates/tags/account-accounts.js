riot.tag2('account-accounts', '<div> <div class="c-card c-card--higher"> <virtual each="{account_type in store.accounts}"> <div class="c-card__content c-card__content--divider heading">{account_type}</div> <div class="c-card__item" each="{account in store.accounts[account_type]}"> <div class="o-grid account-account"> <div class="o-grid__cell o-grid__cell--width-30"><span class="account-name">{account.name}</span></div> <div class="o-grid__cell o-grid__cell--width-30"><span class="fa fa-dollar"></span>{account.balance}</div> <div class="o-grid__cell o-grid__cell--width-40"> <span> <button if="{account_type == \'capital\'}" class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Transfer in</button> <button if="{account_type == \'capital\'}" class="c-button c-button--ghost-error fa fa-dollar" onclick="{transfer_out}"> Transfer out</button> <button if="{account_type == \'debit\'}" class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Pay</button> <button if="{account_type == \'liability\'}" class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Pay</button> <button if="{account_type == \'revenue\'}" class="c-button c-button--ghost-success fa fa-arrow-circle-up" onclick="{transfer_in}">Receive salary</button> </span> </div> </div> </div> </virtual> </div> </div>', 'account-accounts .menu,[riot-tag="account-accounts"] .menu,[data-is="account-accounts"] .menu{ position: absolute; } account-accounts .c-button,[riot-tag="account-accounts"] .c-button,[data-is="account-accounts"] .c-button{ font-size: 0.7em; }', 'class="o-grid__cell o-grid__cell--width-40"', function(opts) {
var JS_LOG_LEVEL, self;

self = this;

JS_LOG_LEVEL = window.JS_LOG_LEVEL || 1;

self.on('mount', function() {
  self.store = new AccountStore();
  window.accountstore = self.store;
  RiotControl.addStore(self.store);
  RiotControl.trigger('accounts_fetch');
  RiotControl.on('accounts_update', function() {
    console.log('update');
    return self.update();
  });
  return self.update();
});

self.edit_account = function(e) {
  var currentName, replace;
  console.log(e);
  window.target = e.target;
  currentName = $(e.target).parents('.account-account').find('.account-name').text();
  replace = $("<input type='text' value='" + currentName + "'>");
  return $(e.target).parents('.account-account').find('.account-name').css({
    color: "green"
  }).replaceWith(replace);
};
});
