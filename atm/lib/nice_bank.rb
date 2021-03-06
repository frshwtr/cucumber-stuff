require_relative 'transaction_queue'
require_relative 'account'

class CashSlot
    def contents
        @contents or raise("I'm Empty!")
    end

    def dispense(amount)
        @contents = amount
    end
end

class Teller
    def initialize(cash_slot)
        @cash_slot = cash_slot
    end
    def withdraw_from(account, amount)
        account.debit(amount)
        @cash_slot.dispense(amount)
    end
end

require 'sinatra'

get '/' do
    %{
        <html>
            <body>
                <form action="withdraw" method="post>
                    <label for="amount">Amount</label>
                    <input type="text" id="amount" name="amount">
                    <button type="submit">Withdraw</button>
                </form>
            </body>
        </html>
    }
end

set :cash_slot, CashSlot.new
set :account do
    fail 'Account has not been set'
end

post '/withdraw' do
    teller = Teller.new(settings.cash_slot)
    teller.withdraw_from(settings.account, params[:amount].to_i)
end
