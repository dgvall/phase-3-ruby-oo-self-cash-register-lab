class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, amount, quantity = 1)
    self.last_transaction = amount * quantity
    self.total += self.last_transaction
    quantity.times do
      self.items << title
    end
  end

  def apply_discount
    @total = @total - (@total * @discount / 100)

    if @discount > 0
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
