module EventsHelper
  def event_image(event)
    if event.image.attached?
      event.image
    else
      ActionController::Base.helpers.asset_path('events_2.jpg')
    end
  end

  def owned_by_user?(event)
    current_user == event.user
  end

  def paid_event(event)
    event.paid ? "Yes" : "No"
  end

  def active_text(event)
    event.active ? "Make Inactive" : "Make active"
  end
end
