class ApplicationQuery
  attr_reader :relation, :options
  class_attribute :relation_class

  class << self
    def call(*args)
      new(*args).call
    end

    def query_on(object)
      raise StandardError, "#{name} class's query_on method require param as a model class name, can not be blank." if object.blank?

      self.relation_class = object.is_a?(String) ? object.constantize : object
    end

    def base_relation
      raise StandardError, "#{name} class require relation class defined. Use query_on method to define it." unless relation_class

      relation_class.all
    end
  end

  def initialize(*args)
    @options = args.extract_options!
    @relation = args.first || self.class.base_relation
  end

  def call
    raise NotImplementedError, "You must define `call` as instance method in #{self.class.name} class."
  end

  # Usage:
  #   Inherited class should set relation class by call `query_on` method and
  #   define `call` as instance method which returns ActiveRecord::Relation object
  #
  # class RecentlyActivatedUsersQuery < ApplicationQuery
  #   query_on 'User'
  #
  #   def call
  #     relation.active.where(activated_at: date_range)
  #   end
  #
  #   private
  #
  #   def date_range
  #     options.fetch(:date_range, default_date_range)
  #   end
  #
  #   def default_date_range
  #     Date.yesterday.beginning_of_day..Date.current.end_of_day
  #   end
  # end
  #
  # RecentlyActivatedUsersQuery.call
  # RecentlyActivatedUsersQuery.call(date_range: Date.today.beginning_of_day..Date.today.end_of_day)
  # RecentlyActivatedUsersQuery.call(User.male, date_range: Date.today.beginning_of_day..Date.today.end_of_day)
end
