class ApplicationQuery
  attr_reader :relation

  class << self
    def relation_class_name
      raise NoMethodError, "You must define relation_class_name as class method in #{name} class"
    end

    def relation_class
      relation_class_name.constantize
    end
  end

  def initialize(relation = self.class.relation_class.all)
    @relation = relation
  end

  # Usage:
  # Inherited class must define relation_class_name as class method, which returns model name by string.
  #
  # class UserQuery
  #   class << self
  #     def relation_class_name
  #       'User'
  #     end
  #   end
  #
  #   def active
  #     relation.where(status: :active)
  #   end
  # end
  #
  # user_query = UserQuery.new
  # active_users = user_query.active
end
