class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @future_bookings = current_user.bookings.future
    @past_bookings = current_user.bookings.past
  end

  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.dog = @dog
    @booking.user = current_user
      if @booking.save
        redirect_to bookings_path
      else
        render "dogs/show", status: :unprocessable_entity
      end
     end

     private

     def booking_params
      params.require(:booking).permit(:start_date, :end_date, :status)
    end
end
