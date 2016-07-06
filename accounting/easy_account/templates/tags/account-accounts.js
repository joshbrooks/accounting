riot.tag2('account-accounts', '<div> <div class="c-card c-card--higher"> <virtual each="{account_type in accountstore.accounts}"> <div class="c-card__content c-card__content--divider heading">{account_type}</div> <div class="c-card__item" each="{account in accountstore.accounts[account_type]}"> <div class="o-grid account-account"> <div class="o-grid__cell o-grid__cell--width-30"><span class="account-name">{account.name}</span></div> <div class="o-grid__cell o-grid__cell--width-30"><span class="fa fa-dollar"></span>{account.openingbalance}</div> <div class="o-grid__cell o-grid__cell--width-40"> <span> <button class="c-button c-button--ghost-success fa fa-arrow-circle-down" onclick="{ping}"> </button> <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button> <button class="c-button c-button--ghost-success fa fa-edit" onclick="{edit_account}"> </button> </span> </div> </div> </div> </virtual> </div> </div>', 'account-accounts .menu,[riot-tag="account-accounts"] .menu,[data-is="account-accounts"] .menu{ position: absolute; }', 'class="o-grid__cell o-grid__cell--width-40"', function(opts) {
var JS_LOG_LEVEL, self;

self = this;

JS_LOG_LEVEL = window.JS_LOG_LEVEL || 1;

self.on('mount', function() {
  self.accountstore = AccountStore();
  RiotControl.addStore(self.accountstore);
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
