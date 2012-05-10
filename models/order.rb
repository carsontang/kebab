class Order < ActiveRecord::Base
  
  after_create :notify
  
  BEEF_COUNT_RANGE = 0..5
  CHICKEN_COUNT_RANGE = 0..5
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :beef_count, presence: true, inclusion: { :in => BEEF_COUNT_RANGE }
  validates :chicken_count, presence: true, inclusion: { :in => CHICKEN_COUNT_RANGE }
  
  private
    def notify
      # using Gmail account, send email to Carson and Nima's phone
    end
end