class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items

  before_validation :downcase_email
  before_validation :upcase_state

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: \A@\z }
    validates :state, inclusion: { in: %w(AL AK AR AZ CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI 
      MN MS MO MT NE NH NV NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA DC WA WV WI WY),
      message: "%{value} is not a valid state" }
    validates :zip_code, length: { is: 5 }, allow_blank: true

  def upcase_state
      self.state = state.to_s.upcase
  end
       
  def downcase_email
      self.email = email.to_s.downcase
  end
end  
