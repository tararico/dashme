class HomeController < ApplicationController
  skip_before_action :set_hamburger_menu
  skip_before_action :require_login, only: [:about]

  def about
  end
end
