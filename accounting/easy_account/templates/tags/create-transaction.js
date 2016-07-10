
riot.tag2('create-transaction', '<h3>{opts.title}</h3> <form method="post" onsubmit="{create_transaction}"> <input name="csrfmiddlewaretoken" value="{$.cookie(\'csrftoken\')}"> <input name="name" placeholder="name" value="{name}"> <input name="description" placeholder="description" value="{description}"> <p>From: {from_account.name}</p> <input type="hidden" name="from_account" placeholder="from_account" value="{from_account.id}"> <p>To: {to_account.name}</p> <input type="hidden" name="to_account" placeholder="to_account" value="{to_account.id}"> <select name="currency"> <option value="USD">USD</option> </select> <input name="amount" placeholder="amount"> <button type="submit">Create</button> </form>', '', '', function(opts) {
var self;

self = this;

self.store = window.transactionstore;

self.description = '';

self.name = '';

self.from_account = {
  'name': '(Select account)',
  'id': '0'
};

self.to_account = {
  'name': '(Select account)',
  'id': '0'
};

self.on('mount', function() {});

self.create_transaction = function(e) {
  console.log(e);
  return $(e.target).ajaxSubmit({
    url: Urls['accounts:transactions'](),
    success: function() {
      return RiotControl.trigger('accounts_fetch');
    }
  });
};

RiotControl.on('set-transaction-option', function(name, value) {
  console.log("set-transaction-option, " + name + ", " + value);
  self[name] = value;
  return self.update();
});
});