<account-transactions class="o-grid__cell o-grid__cell--width-60">
    <div>
        <div class="c-card c-card--higher">
            <div class="c-card__content c-card__content--divider heading">Transactions</div>
            <div class="c-card__item">

                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-20">ANZ Bank Account</div>
                    <div class="o-grid__cell o-grid__cell--width-30"> { type } </div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ time }</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span> { amt } </div>
                    <div class="o-grid__cell o-grid__cell--width-10">
                                <span>
                                    <button class="c-button c-button--ghost-success fa fa-edit"> </button>
                                    <button class="c-button c-button--ghost-error fa fa-remove"></button>
                                </span>
                    </div>
                </div>
                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-20">ANZ Bank Account</div>
                    <div class="o-grid__cell o-grid__cell--width-30"> { type } </div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ time }</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span> { amt } </div>
                    <div class="o-grid__cell o-grid__cell--width-10">
                                <span>
                                    <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button>
                                    <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>

                                </span>
                    </div>
                </div>
                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-20">ANZ Bank Account</div>
                    <div class="o-grid__cell o-grid__cell--width-30"> { type } </div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ time }</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span> { amt } </div>
                    <div class="o-grid__cell o-grid__cell--width-10">
                                <span>
                                    <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button>
                                    <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>
                                </span>
                    </div>
                </div>
                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-20">ANZ Bank Account</div>
                    <div class="o-grid__cell o-grid__cell--width-30"> { type } </div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ time }</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span> { amt } </div>
                    <div class="o-grid__cell o-grid__cell--width-10">
                                <span>
                                    <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button>
                                    <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>
                                </span>
                    </div>
                </div>

                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-20">ANZ Bank Account</div>
                    <div class="o-grid__cell o-grid__cell--width-30"> { type } </div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ time }</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span> { amt } </div>
                    <div class="o-grid__cell o-grid__cell--width-10">
                                <span>
                                    <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button>
                                    <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>
                                </span>
                    </div>
                </div>


                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-20">ANZ Bank Account</div>
                    <div class="o-grid__cell o-grid__cell--width-30"> { type } </div>
                    <div class="o-grid__cell o-grid__cell--width-20">{ time }</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span> { amt } </div>
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
    <script type="coffee">
        @on 'mount', ->
          console.log 'Go!'
          @update()

        @project_list = () ->
          RiotControl.trigger 'transaction_list_load'
    </script>
</account-transactions>
