class Chef < MiniActiveRecord::Model

  self.attribute_names = [:id, :first_name, :last_name, :email, :phone,
                          :birthday, :created_at, :updated_at]

  def meals
    Meal.where('chef_id = ?', self[:id])
  end

  def add_meals(meals)
    meals.each do |meal|
      meal.chef = self
    end
    meals
  end


  private

  # def update!
  #   self[:updated_at] = DateTime.now

  #   fields = self.attributes.keys
  #   values = self.attributes.values

  #   update_clause = fields.map { |field| "#{field} = ?" }.join(',')
  #   update_sql = "UPDATE chefs SET #{update_clause} WHERE id = ?"

  #   # We have to use the (potentially) old ID attribute in case the user has re-set it.
  #   MiniActiveRecord::Model.execute(update_sql, *values, self.old_attributes[:id])
  # end
end