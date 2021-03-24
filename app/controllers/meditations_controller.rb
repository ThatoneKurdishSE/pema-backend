class MeditationsController < ApplicationController
    def index
        @meditations = Meditation.all

        render json: { meditations: @meditations }
    end
end
