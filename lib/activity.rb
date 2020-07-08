class Activity
 attr_reader  :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(participant, paid)
    @participants[participant] = paid
  end

  def total_cost
    @total_paid = 0
      @participants.sum do |_, paid|
        @total_paid += paid
      end
      @total_paid
  end

  def split
    @total_paid /@participants.count
  end

  def owed
    @participants.each do |participant, paid|
      @participants[participant] =  split - paid
    end
  end
end
