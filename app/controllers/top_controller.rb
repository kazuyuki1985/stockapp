class TopController < StockappController

def index
    @notes = current_user.notes
end
end