module EventsHelper

    def attending(event)
      if logged_in?
        if event.attendees.include? current_user
          return button_to 'Withdraw', withdraw_event_path(@event), method: :post
        else
          return button_to 'Attend', attend_event_path(@event), method: :post
        end
      end
    end
end
