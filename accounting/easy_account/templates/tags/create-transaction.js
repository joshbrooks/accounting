
riot.tag2('create-transaction', '<h3>{opts.title}</h3> <form action="{Urls[\'accounts:transactions\']()}" method="post" onsubmit="{create-transaction}"> <input name="csrfmiddlewaretoken" value="{$.cookie(\'csrftoken\')}"> <input name="name" placeholder="name" value="{name}"> <input name="description" placeholder="description" value="{description}"> <p>From: {from_account.name}</p> <input type="hidden" name="from_account" placeholder="from_account" value="{from_account.id}"> <p>{to_account.name}</p> <input type="hidden" name="to_account" placeholder="to_account" value="{to_account.id}"> <select name="currency"> <option value="USD">USD</option> </select> <input name="amount" placeholder="amount"> <button type="submit">Create</button> </form>', '', '', function(opts) {
var self;

self = this;

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

self.on('create-transaction', function(e) {
  return $(e.target).ajaxForm();
});

RiotControl.on('set-transaction-option', function(name, value) {
  self[name] = value;
  self.update();
});
});