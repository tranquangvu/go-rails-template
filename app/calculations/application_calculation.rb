class ApplicationCalculation
  attr_reader :options

  def self.call(*args)
    new(*args).call
  end

  def initialize(*args)
    @options = args.extract_options!
  end

  def call
    raise NotImplementedError, "You must define `call` as instance method in #{self.class.name} class."
  end

  # Usage:
  #
  # class AverageHotelDailyRevenueCalculation < ApplicationCalculation
  #   def call
  #     reservations.sum(:price) / number_of_days_in_year
  #   end
  #
  #   private
  #
  #   def reservations
  #     Reservation.where(
  #       date: (beginning_of_year..end_of_year),
  #       hotel_id: options[:hotel_id]
  #     )
  #   end
  #
  #   def number_of_days_in_year
  #     end_of_year.yday
  #   end
  #
  #   def year
  #     options[:year] || Date.current.year
  #   end
  #
  #   def beginning_of_year
  #     Date.new(year).beginning_of_year
  #   end
  #
  #   def end_of_year
  #     Date.new(year).end_of_year
  #   end
  # end
  #
  # hotel = current_user.owned_hotel
  # AverageHotelDailyRevenueCalculation.call(hotel_id: hotel.id)
  # AverageHotelDailyRevenueCalculation.call(hotel_id: hotel.id, year: 2018)
end
