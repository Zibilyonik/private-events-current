module EventsHelper
  def attending(event)
    return nil unless logged_in?

    if event.attendees.include? current_user
      button_to 'Withdraw', withdraw_event_path(@event), method: :post
    else
      button_to 'Attend', attend_event_path(@event), method: :post
    end
  end
end
