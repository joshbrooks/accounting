<account-accounts class="o-grid__cell o-grid__cell--width-40">
    <div>
        <div class="c-card c-card--higher" >

            <virtual  each={account_type in accounts}>
                <div class="c-card__content c-card__content--divider heading">{ account_type }</div>

                <div class="c-card__item" each={account in accounts[account_type] }>
                    <div class="o-grid">
                        <div class="o-grid__cell o-grid__cell--width-30">{ account.name }</div>
                        <div class="o-grid__cell o-grid__cell--width-30"><span class="fa fa-dollar"></span>{ account.openingbalance }</div>
                        <div class="o-grid__cell o-grid__cell--width-40">

                            <span>
                                <button class="c-button c-button--ghost-success fa fa-arrow-circle-down" onclick={ ping }> </button>
                                <button class="c-button c-button--ghost-error fa fa-arrow-circle-up" onclick={ ping }></button>
                                <button class="c-button c-button--ghost-success fa fa-edit" onclick={ ping }> </button>
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

    </style>

    <script type="text/coffeescript">
        self = this
        JS_LOG_LEVEL = window.JS_LOG_LEVEL or 1
        self.on 'mount', ->
          console.log 'mounting <account-accounts>' if JS_LOG_LEVEL < 2
          RiotControl.trigger('accounts_init')


        RiotControl.on 'accounts_changed', (accounts) ->
            self.accounts = accounts
            console.log 'accounts_changed' if JS_LOG_LEVEL < 2
            self.update()

        # -- Dummy data --
        accounts = capital: [
          {
            name: 'ANZ'
            currency: 'USD'
            openingbalance: 10.10
            openingbalance: 10.10
          }
          {
            name: 'ANZ'
            currency: 'USD'
            openingbalance: 10.10
            estimatedbalance: 10.10
          }
        ],
        debit: [
          {
            name: 'ANZ'
            currency: 'USD'
            openingbalance: 10.10
            openingbalance: 10.10
          }
          {
            name: 'ANZ'
            currency: 'USD'
            openingbalance: 10.10
            estimatedbalance: 10.10
          }
        ]

        window.AccountStore = () ->
          riot.observable(this)
          console.log 'created AccountStore' if JS_LOG_LEVEL < 2
          self = this
          self.accounts = accounts
          console.log accounts
          self.on 'accounts_init', () ->
              console.log 'triggered accounts_init' if JS_LOG_LEVEL < 2
              self.trigger 'accounts_changed', self.accounts
          self.on 'account_add', (account, category) ->
            self.accounts.category.push(account)
            self.trigger 'accounts_changed', accounts

        window.accountstore = AccountStore()
        RiotControl.addStore(window.accountstore)
        RiotControl.trigger('accounts_changed')
    </script>
</account-accounts>
