class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Reservation.all.to_json
  rescue => error
		render json: { error: error }, status: :bad_request
  end
  
  def create
    Reservation.create user_params
  rescue => error
		render json: { error: error }, status: :bad_request
  end

  def destroy
    Reservation.destroy params[:id]
  rescue => error
		render json: { error: error }, status: :bad_request
  end
  
  def update
    reservation = Reservation.find_by id: params[:id]
    reservation.update_attributes user_params
  rescue => error
		render json: { error: error }, status: :bad_request
  end

  def cancel
    reservation = Reservation.find_by id: params[:id]
    reservation.update_attributes cancelled: true
  rescue => error
		render json: { error: error }, status: :bad_request
  end

  def show
    render json: Reservation.where(:id_user => params[:id]).to_json
  rescue => error
		render json: { error: error }, status: :bad_request
  end

  def cancelled
    if params[:user]
      reservation = Reservation.where id_user: params[:user], cancelled: true
      render json: reservation.to_json
    else
      render json: Reservation.where(cancelled: true).to_json
    end
  rescue => error
		render json: { error: error }, status: :bad_request
  end

  def pending
    if params[:user]
      reservation = Reservation.where id_user: params[:user], cancelled: false
      render json: reservation.to_json
    else

      render json: Reservation.where(cancelled: false).to_json
    end
  rescue => error
		render json: { error: error }, status: :bad_request
  end

  def cancelled_target
    render json: Reservation.where(cancelled: true, id_excursion: params[:id]).to_json
  rescue => error
		render json: { error: error }, status: :bad_request
  end

  def target
    render json: Reservation.where(params.permit(:id_excursion, :id_type)).to_json
  rescue => error
		render json: { error: error }, status: :bad_request
  end

  def filter_by_date
    render json: Reservation.where(created_at: params[:start_date]..params[:end_date]).to_json
  rescue => error
		render json: { error: error }, status: :bad_request
  end
  
  private  
  def user_params
    return params.permit(:id_user, :id_excursion, :id_type, :cancelled)
  end
end