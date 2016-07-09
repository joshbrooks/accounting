
<create-transaction>

  <h3>{ opts.title }</h3>

  <form action="{%  url '{url}' %}" onsubmit={ create-transaction }>
    <input name="name" placeholder="name">
    <input name="description" placeholder="description">
    <input name="from_account" placeholder="from_account">
    <input name="to_account" placeholder="to_account">
    <select name="currency">
        <option value="USD">USD</option>
    </select>
    <input name="amount" placeholder="amount">
      <button type="submit">Create</button>

  </form>

  <!-- this script tag is optional -->
  <script  type="text/coffeescript">
      self = this

      self.url= {% url 'accounts:transactions' %}

      self.on 'mount', ->
          return
      self.on 'create-transaction', (e) ->
          $(e.target).ajaxForm()

      RiotControl.on 'set-transaction-option', (name, value) ->
          self.name.value = value
          self.update()
          return

  </script>

</create-transaction>