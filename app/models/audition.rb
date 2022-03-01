class Audition < ActiveRecord::Base
  belongs_to :role

  def call_back 
    self.hired = true
    self.update hired: true 
  end


end