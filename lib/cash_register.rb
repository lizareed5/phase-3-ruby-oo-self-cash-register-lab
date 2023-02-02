require 'pry'
class CashRegister
    attr_accessor :discount, :total, :quantity, :title, :items, :last_transaction

    def initialize(discount = 0)
        self.discount = discount
        self.total = 0
        self.items = []
    end

    def add_item title, price, quantity = 1
        self.title = title
        self.quantity = quantity
        self.last_transaction = price * quantity
        self.total += last_transaction
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total -= self.total * self.discount / 100
            "After the discount, the total comes to $#{self.total}."
        end
    end


    def void_last_transaction
        self.total = total - last_transaction
        # self.total -= last_transaction
        # self.total -= self.last_transaction
    end
end

# binding.pry
