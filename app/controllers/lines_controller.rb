class LinesController < ApplicationController

    def  new
        @line = Line.new
    end

    def index
        @lines = Line.all        
    end
end
