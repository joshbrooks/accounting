<account-transactions class="o-grid__cell o-grid__cell--width-60">
    <div>
        <div class="c-card c-card--higher">
            <div class="c-card__content c-card__content--divider heading">Transactions</div>
            <div class="c-card__item"  each={transaction in store.transactions}>

                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-20">{ transaction.from_account.name }</div>
                    <div class="o-grid__cell o-grid__cell--width-30"> { transaction.to_account.name } </div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ transaction.name }</div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ transaction.description }</div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ transaction.time  }</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span> { transaction.amt } </div>
                    <div class="o-grid__cell o-grid__cell--width-10">
                                <span>
                                    <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button>
                                    <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>
                                </span>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <style scoped>
        .menu {
            position: absolute;
        }

    </style>

    <script type="text/coffeescript">
        self = this
        self.store = new TransactionStore()
        window.transactionstore = self.store;
        RiotControl.addStore(self.store)
        self.on 'mount', ->
          RiotControl.trigger('transactions_fetch')
          self.update()

          RiotControl.on 'transactions_update', () ->
              console.log 'update'
              self.update()

        self.edit_transaction = (e) -> return
        self.select_transaction = (e) -> return

    </script>
</account-transactions>
