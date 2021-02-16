class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    @@all << self
  end

  def valid?
    if receiver.valid? && sender.valid?
      true
    else
      false
    end
  end
  
  def self.all
    @@all
  end

  def execute_transaction
    if valid? && @sender.balance > self.amount && self.status == "pending"
      @sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
    

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    else
      nil
    end
  end
end
