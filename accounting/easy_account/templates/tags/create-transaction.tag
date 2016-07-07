
<create-transaction>

  <h3>{ opts.title }</h3>

  <form onsubmit={ add }>
    <input name="name" placeholder="name">
    <input name="description" placeholder="description">
    <input name="from_account" placeholder="from_account">
    <input name="to_account" placeholder="to_account">
    <input name="currency" placeholder="currency (USD)">
    <input name="balance" placeholder="balance">
      <button type="submit">Create</button>

  </form>

  <!-- this script tag is optional -->
  <script  type="text/coffeescript">
  </script>

</create-transaction>