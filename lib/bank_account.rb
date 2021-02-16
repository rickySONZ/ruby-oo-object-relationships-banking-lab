class BankAccount

    attr_accessor :balance, :status

    @@all = []

    def initialize(name, balance = 1000, status = "open")
       @name = name
       @balance = balance
       @status = status
       @@all << self

    end

    def self.all
        @@all
    end
    

    def name
        @name
    end

    def deposit(deposit)
        @balance += deposit
    end

    def close_account
        self.status = "closed"
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            true
        else
            false
        end
    end


end
