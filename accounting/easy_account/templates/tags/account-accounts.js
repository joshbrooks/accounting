riot.tag2('account-accounts', '<div> <div class="c-card c-card--higher"> <virtual each="{account_type in accounts}"> <div class="c-card__content c-card__content--divider heading">{account_type}</div> <div class="c-card__item" each="{account in accounts[account_type]}"> <div class="o-grid"> <div class="o-grid__cell o-grid__cell--width-30">{account.name}</div> <div class="o-grid__cell o-grid__cell--width-30"><span class="fa fa-dollar"></span>{account.openingbalance}</div> <div class="o-grid__cell o-grid__cell--width-40"> <span> <button class="c-button c-button--ghost-success fa fa-arrow-circle-down" onclick="{ping}"> </button> <button class="c-button c-button--ghost-error fa fa-arrow-circle-up" onclick="{ping}"></button> <button class="c-button c-button--ghost-success fa fa-edit" onclick="{ping}"> </button> </span> </div> </div> </div> </virtual> </div> </div>', 'account-accounts .menu,[riot-tag="account-accounts"] .menu,[data-is="account-accounts"] .menu{ position: absolute; }', 'class="o-grid__cell o-grid__cell--width-40"', function(opts) {
var JS_LOG_LEVEL, accounts, self;

self = this;

JS_LOG_LEVEL = window.JS_LOG_LEVEL || 1;

self.on('mount', function() {
  if (JS_LOG_LEVEL < 2) {
    console.log('mounting <account-accounts>');
  }
  return RiotControl.trigger('accounts_init');
});

RiotControl.on('accounts_changed', function(accounts) {
  self.accounts = accounts;
  if (JS_LOG_LEVEL < 2) {
    console.log('accounts_changed');
  }
  return self.update();
});

accounts = {
  capital: [
    {
      name: 'ANZ',
      currency: 'USD',
      openingbalance: 10.10,
      openingbalance: 10.10
    }, {
      name: 'ANZ',
      currency: 'USD',
      openingbalance: 10.10,
      estimatedbalance: 10.10
    }
  ],
  debit: [
    {
      name: 'ANZ',
      currency: 'USD',
      openingbalance: 10.10,
      openingbalance: 10.10
    }, {
      name: 'ANZ',
      currency: 'USD',
      openingbalance: 10.10,
      estimatedbalance: 10.10
    }
  ]
};

window.AccountStore = function() {
  riot.observable(this);
  if (JS_LOG_LEVEL < 2) {
    console.log('created AccountStore');
  }
  self = this;
  self.accounts = accounts;
  console.log(accounts);
  self.on('accounts_init', function() {
    if (JS_LOG_LEVEL < 2) {
      console.log('triggered accounts_init');
    }
    return self.trigger('accounts_changed', self.accounts);
  });
  return self.on('account_add', function(account, category) {
    self.accounts.category.push(account);
    return self.trigger('accounts_changed', accounts);
  });
};

window.accountstore = AccountStore();

RiotControl.addStore(window.accountstore);

RiotControl.trigger('accounts_changed');
});
