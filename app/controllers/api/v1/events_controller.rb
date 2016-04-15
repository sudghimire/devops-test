module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json

      def index
        @events = Event.all
      end

      def show
        @event =  Event.find(params[:id])
      end

      def create
        event_hash = parse_json
        event = Event.create(event_hash)
        if event.save
          render json: {message: "Event created"}
        else
          render json: {message: "Couldn't create event"}
        end
      end

      def update
        event_json = parse_json
        event =  Event.update(params[:id], event_json)
        if event.save
          render json: {message: "Event updated"}
        else
          render json: {message: "Couldn't update event"}
        end
      end

      def destroy
        Event.destroy(params[:id])
        render json: {message: "Event deleted"}
      end

      private

      def parse_json
        begin
          JSON.parse(params[:event])
        rescue
          render json: {message: "Invalid JSON"}
        end
      end

    end

  end
end