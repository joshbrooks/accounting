<account-accounts class="o-grid__cell o-grid__cell--width-40">
    <div>
        <div class="c-card c-card--higher" >

            <virtual  each={account_type in accountstore.accounts}>
                <div class="c-card__content c-card__content--divider heading">{ account_type }</div>

                <div class="c-card__item" each={account in accountstore.accounts[account_type] }>
                    <div class="o-grid account-account">
                        <div class="o-grid__cell o-grid__cell--width-30"><span class="account-name">{ account.name }</span></div>
                        <div class="o-grid__cell o-grid__cell--width-30"><span class="fa fa-dollar"></span>{ account.openingbalance }</div>
                        <div class="o-grid__cell o-grid__cell--width-40">

                            <span>
                                <button class="c-button c-button--ghost-success fa fa-arrow-circle-down" onclick={ ping }> </button>
                                <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>
                                <button class="c-button c-button--ghost-success fa fa-edit" onclick={ edit_account }> </button>
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

        AccountStore = () ->
          riot.observable(this)
          console.log 'created AccountStore' if JS_LOG_LEVEL < 2
          self = this
          self.accounts = []
          self.on 'accounts_fetch', () ->
            # TODO: Make an HTTP request to get latest accounts

            xhr = $.getJSON('/accounts')
            xhr.done () ->
              self.accounts = xhr.responseJSON
              RiotControl.trigger('accounts_update')

          self.on 'accounts_init', () ->
              console.log 'triggered accounts_init' if JS_LOG_LEVEL < 2
              self.trigger 'accounts_changed', self.accounts
          self.on 'account_add', (account, category) ->
            self.accounts.category.push(account)
            self.trigger 'accounts_changed', accounts

    </script>
    <script type="text/coffeescript">
        self = this
        JS_LOG_LEVEL = window.JS_LOG_LEVEL or 1
        self.on 'mount', ->
          self.accountstore = AccountStore()
          RiotControl.addStore(self.accountstore)
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

    </script>
</account-accounts>
