class Expense < Transaction
  before_save :negate_amount
  
  private
  
  def negate_amount
    if self.amount > 0
      self.amount *= -1
    end
  end
end
