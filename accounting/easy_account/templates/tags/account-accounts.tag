<account-accounts class="o-grid__cell o-grid__cell--width-40">
    <div>
        <div class="c-card c-card--higher" >

            <div  each={account_type in accounts}>
                <div class="c-card__content c-card__content--divider heading">{ gettext(account_type) }</div>

                <div class="c-card__item" each={account in accounts[account_type] }>
                    <div class="o-grid account-account">
                        <div class="o-grid__cell o-grid__cell--width-30"><span class="account-name">{ account.name }</span></div>
                        <div class="o-grid__cell o-grid__cell--width-30"><span class="fa fa-dollar"></span>{ account.balance }</div>
                        <div class="o-grid__cell o-grid__cell--width-40">

                            <span>
                                <a if={account_type == 'capital'} class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Transfer in</a>
                                <a if={account_type == 'capital'} class="c-button c-button--ghost-error fa fa-dollar" onclick="{transfer_out}"> Transfer out</a>

                                <a if={account_type == 'debit'} class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Pay</a>
                                <a if={account_type == 'liability'} class="c-button c-button--ghost-success fa fa-dollar" onclick="{transfer_in}"> Pay</a>

                                <a if={account_type == 'revenue'} class="c-button c-button--ghost-success fa fa-arrow-circle-up" onclick="{transfer_in}">Receive salary</a>

                            </span>

                        </div>
                    </div>
                </div>
            </div>
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
        self.accounts = {}
        self.on 'mount', ->
          RiotControl.trigger 'accounts_fetch'

        RiotControl.on 'accounts_changed', (accounts) ->
            console.log 'accounts_changed TRIGGERED'
            self.accounts = accounts
            console.log self.accounts
            self.update()


        self.edit_account = (e) ->

          console.log e
          window.target = e.target
          currentName = $(e.target).parents('.account-account').find('.account-name').text()
          replace = $("<input type='text' value='#{currentName}'>")
          $(e.target).parents('.account-account').find('.account-name').css({color:"green"}).replaceWith(replace)
          # TODO: Pop up a modal form with account info

        self.transfer_out = (e) ->
            console.log(e)
            RiotControl.trigger('set-transaction-option', 'from_account', e.item.account)

        self.transfer_in = (e) ->
            RiotControl.trigger('set-transaction-option', 'to_account', e.item.account)

    </script>
</account-accounts>
