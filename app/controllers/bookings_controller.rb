class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bookings = current_user.bookings
  end

  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
     end

     def create
      @dog = Dog.find(params[:dog_id])
      @booking = Booking.new(booking_params)
      @booking.dog = @dog
      if @booking.save
        redirect_to booking_index_path(@dog)
      else
        render :new, status: :unprocessable_entity
      end
     end

     private

     def booking_params
      params.require(:booking).permit(:start_date, :end_date, :status)
    end
end
