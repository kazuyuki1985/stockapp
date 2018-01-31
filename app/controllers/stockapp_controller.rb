class StockappController  < ApplicationController
    before_action :authenticate_user!
    before_action :get_menu
    layout 'login'

    def show
    end

end