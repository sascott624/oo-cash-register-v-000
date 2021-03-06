require 'pry'
class CashRegister

  attr_accessor :total, :discount, :item_array, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @item_array = []
    @last_transaction = []
  end

  def add_item(title, price, quantity = 1)
    @total += price*quantity
    quantity.times {@item_array << title}
    @last_transaction = price*quantity
  end

  def apply_discount
    if @discount != nil
      @total = @total-(@total*@discount/100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item_array
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end

end
