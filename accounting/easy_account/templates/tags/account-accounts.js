riot.tag2('account-accounts', '<div> <div class="c-card c-card--higher"> <div each="{account_type in accounts}"> <div class="c-card__content c-card__content--divider heading">{gettext(account_type)}</div> <div class="c-card__item" each="{account in accounts[account_type]}"> <div class="o-grid account-account"> <div class="o-grid__cell o-grid__cell--width-30"><span class="account-name">{account.name}</span></div> <div class="o-grid__cell o-grid__cell--width-30"><span class="fa fa-dollar"></span>{account.balance}</div> <div class="o-grid__cell o-grid__cell--width-40"> <span> <a if="{account_type == \'capital\'}" class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Transfer in</a> <a if="{account_type == \'capital\'}" class="c-button c-button--ghost-error fa fa-dollar" onclick="{transfer_out}"> Transfer out</a> <a if="{account_type == \'debit\'}" class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Pay</a> <a if="{account_type == \'liability\'}" class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Pay</a> <a if="{account_type == \'revenue\'}" class="c-button c-button--ghost-success fa fa-arrow-circle-up" onclick="{transfer_in}">Receive salary</a> </span> </div> </div> </div> </div> </div> </div>', 'account-accounts .menu,[riot-tag="account-accounts"] .menu,[data-is="account-accounts"] .menu{ position: absolute; } account-accounts .c-button,[riot-tag="account-accounts"] .c-button,[data-is="account-accounts"] .c-button{ font-size: 0.7em; }', 'class="o-grid__cell o-grid__cell--width-40"', function(opts) {
var self;

self = this;

self.accounts = {};

self.on('mount', function() {
  return RiotControl.trigger('accounts_fetch');
});

RiotControl.on('accounts_changed', function(accounts) {
  console.log('accounts_changed TRIGGERED');
  self.accounts = accounts;
  console.log(self.accounts);
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

self.transfer_out = function(e) {
  console.log(e);
  return RiotControl.trigger('set-transaction-option', 'from_account', e.item.account);
};

self.transfer_in = function(e) {
  return RiotControl.trigger('set-transaction-option', 'to_account', e.item.account);
};
});
