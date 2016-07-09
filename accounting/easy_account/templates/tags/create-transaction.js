
riot.tag2('create-transaction', '<h3>{opts.title}</h3> <form action="action" onsubmit="{create-transaction}"> <input name="name" placeholder="name"> <input name="description" placeholder="description"> <input name="from_account" placeholder="from_account"> <input name="to_account" placeholder="to_account"> <select name="currency"> <option value="USD">USD</option> </select> <input name="amount" placeholder="amount"> <button type="submit">Create</button> </form>', '', '', function(opts) {
var self;

self = this;

self.on('mount', function() {});

self.on('create-transaction', function(e) {
  return $(e.target).ajaxForm();
});

RiotControl.on('set-transaction-option', function(name, value) {
  self.name.value = value;
  self.update();
});
});