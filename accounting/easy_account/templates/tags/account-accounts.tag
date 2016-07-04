<account-accounts class="o-grid__cell o-grid__cell--width-25">
    <div>
        <div class="c-card c-card--higher">
            <div class="c-card__content c-card__content--divider heading">Accounts</div>
            <div class="c-card__item">
                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-40">ANZ Bank Account</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span>33.45</div>
                    <div class="o-grid__cell o-grid__cell--width-40">

                        <span>
                            <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button>
                            <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>
                            <button class="c-button c-button--ghost-success fa fa-edit"> </button>
                        </span>

                    </div>
                </div>
            </div>

            <div class="c-card__item">
                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-40">Alexhia's Wallet</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span>33.45</div>
                    <div class="o-grid__cell o-grid__cell--width-40">

                        <span>
                            <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button>
                            <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>
                            <button class="c-button c-button--ghost-success fa fa-edit"> </button>
                        </span>

                    </div>
                </div>
            </div>
            <div class="c-card__item">
                <div class="o-grid">
                    <div class="o-grid__cell o-grid__cell--width-40">ANZ Bank Account</div>
                    <div class="o-grid__cell o-grid__cell--width-20"><span class="fa fa-dollar"></span>33.45</div>
                    <div class="o-grid__cell o-grid__cell--width-40">

                        <span>
                            <button class="c-button c-button--ghost-success fa fa-arrow-circle-down"> </button>
                            <button class="c-button c-button--ghost-error fa fa-arrow-circle-up"></button>
                            <button class="c-button c-button--ghost-success fa fa-edit"> </button>
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
</account-accounts>
