class Reunion
 attr_reader  :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity, _|
      activity.total_cost
    end
  end

  def breakout
    debt = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, amount|
        debt[name] += amount
      end
      require "pry"; binding.pry
    end
    debt

  end



end
# For the `breakout` method, the key is a person's name and the value is what they owe for the whole reunion. This should be the combination of what they owe from all activities. Again, a negative value means they are owed money. In the following example, `"Maria"` owes 10 from brunch and is owed 20 from drinks, so her final amount owed in the breakout is -10.
