require 'pry'
class CashRegister
  attr_accessor :discount, :total, :quantity, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @@all = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times{@@all << title}
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      discount_decimal = @discount.to_f / 100
      money_saved = @total * discount_decimal
      @total -= money_saved
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @@all
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
