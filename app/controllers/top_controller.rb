class TopController < ApplicationController

def index
    @notes = Note.all
end
end