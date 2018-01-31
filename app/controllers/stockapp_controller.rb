class StockappController  < ApplicationController
    before_action :authenticate_user!
    before_action :getmenu