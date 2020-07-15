module EventsHelper
  def event_image(event)
    if event.image.attached?
      event.image
    else
      ActionController::Base.helpers.asset_path('events_2.jpg')
    end
  end
end
