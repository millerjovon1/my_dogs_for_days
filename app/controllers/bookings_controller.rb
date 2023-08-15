class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @future_bookings = current_user.bookings.future
    @past_bookings = current_user.bookings.past
  end



end
