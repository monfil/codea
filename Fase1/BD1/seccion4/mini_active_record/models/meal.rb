class Meal < MiniActiveRecord::Model

  self.attribute_names = [:id, :name, :chef_id, :created_at, :updated_at]

  def chef
    Chef.where('id = ?', self[:chef_id])
  end

  def chef=(chef)
    self[:chef_id] = chef[:id]
    self.save
    chef
  end

  private

  # def update!
  #   self[:updated_at] = DateTime.now

  #   fields = self.attributes.keys
  #   values = self.attributes.values

  #   update_clause = fields.map { |field| "#{field} = ?" }.join(',')
  #   update_sql = "UPDATE meals SET #{update_clause} WHERE id = ?"

  #   # We have to use the (potentially) old ID attribute in case the user has re-set it.
  #   MiniActiveRecord::Model.execute(update_sql, *values, self.old_attributes[:id])
  # end
end
