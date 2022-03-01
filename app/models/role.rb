class Role < ActiveRecord::Base
  has_many :auditions

# Role#actors returns an array of names from the actors associated with this role
# Role#locations returns an array of locations from the auditions associated with this role
# Role#lead returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
# Role#understudy returns the second instance of the audition that was hired for this role or returns a string 'no actor has been hired for understudy for this role'

  def actors
    self.auditions.map {|audition| audition.actor}
  end

  def locations
    self.auditions.map {|audition| audition.location}
  end

  def lead
    firstActor = self.auditions.find_by(hired: true)
    !firstActor ? 'no actor has been hired for this role' : found
  end

  def understudy
    actors = self.auditions.where(hired: true)
    if actors.size > 1
        actors[1]
    else
        'no actor has been hired for understudy for this role'
    end
end 

end