class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: true
  validates :annual_revenue, inclusion: 0..Float::INFINITY
  
  validate :carries_at_least_mens_or_womens_apparel
  def carries_at_least_mens_or_womens_apparel
    if !(mens_apparel || womens_apparel)
      errors.add(:must_carry, "at least one of men's or women's apparel")
    end
  end
end
