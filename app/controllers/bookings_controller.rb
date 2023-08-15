class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bookings = current_user.bookings
  end
end
