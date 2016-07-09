<account-accounts class="o-grid__cell o-grid__cell--width-40">
    <div>
        <div class="c-card c-card--higher" >

            <virtual  each={account_type in store.accounts}>
                <div class="c-card__content c-card__content--divider heading">{ account_type }</div>

                <div class="c-card__item" each={account in store.accounts[account_type] }>
                    <div class="o-grid account-account">
                        <div class="o-grid__cell o-grid__cell--width-30"><span class="account-name">{ account.name }</span></div>
                        <div class="o-grid__cell o-grid__cell--width-30"><span class="fa fa-dollar"></span>{ account.balance }</div>
                        <div class="o-grid__cell o-grid__cell--width-40">

                            <span>
                                <button if={account_type == 'capital'} class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Transfer in</button>
                                <button if={account_type == 'capital'} class="c-button c-button--ghost-error fa fa-dollar" onclick="{transfer_out}"> Transfer out</button>

                                <button if={account_type == 'debit'} class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Pay</button>
                                <button if={account_type == 'liability'} class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Pay</button>

                                <button if={account_type == 'revenue'} class="c-button c-button--ghost-success fa fa-arrow-circle-up" onclick="{transfer_in}">Receive salary</button>

                            </span>

                        </div>
                    </div>
                </div>
            </virtual>
        </div>
    </div>

    <style scoped>
        .menu {
            position: absolute;
        }
        .c-button {
            font-size: 0.7em;
        }
    </style>

    <script type="text/coffeescript">
        self = this
        JS_LOG_LEVEL = window.JS_LOG_LEVEL or 1
        self.on 'mount', ->
          self.store = new AccountStore()
          window.accountstore = self.store;
          RiotControl.addStore(self.store)
          RiotControl.trigger('accounts_fetch')

          RiotControl.on 'accounts_update', () ->
            console.log 'update'
            self.update()

          self.update()

        self.edit_account = (e) ->

          console.log e
          window.target = e.target
          currentName = $(e.target).parents('.account-account').find('.account-name').text()
          replace = $("<input type='text' value='#{currentName}'>")
          $(e.target).parents('.account-account').find('.account-name').css({color:"green"}).replaceWith(replace)
          # TODO: Pop up a modal form with account info

        self.transfer_out = (e) ->
            RiotControl.trigger('set-transaction-option', 'from_account', e.item.account.id)

        self.transfer_in = (e) ->
            RiotControl.trigger('set-transaction-option', 'to_account', e.item.account.id)

    </script>
</account-accounts>
