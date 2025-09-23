class UsersController < ApplicationController
  include ApplicationHelper

  def index
    @users = User.all

    seach_name = params[:search]
    if seach_name.present?
      first_name = seach_name.split(" ")[0]
      last_name = seach_name.split(" ")[1]
      @users = @users.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{first_name}%", "%#{first_name}%") if first_name.present?
      @users = @users.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{last_name}%", "%#{last_name}%") if last_name.present?
    end

    @users = @users.order("#{sort_column} #{sort_direction}")

    @users = @users.page(params[:page])
  end
end
