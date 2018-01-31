class TopController < StockappController

def index
    @notes = Note.all
end
end