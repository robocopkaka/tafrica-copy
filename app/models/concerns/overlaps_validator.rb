class OverlapsValidator < ActiveModel::Validator
  def validate(record)
    events = record.user.events.reject { |event| event.id == record.id }
    events = events.pluck(:start_time, :end_time)
    event_time = { start_time: record.start_time, end_time: record.end_time }

    return unless time_overlaps?(event_time, events)

    record.errors[:base] << "You have an event that overlaps at these times"
  end

  private

  def time_overlaps?(event_times, all_events_times)
    occurrences = all_events_times.select do |time_range|
      event_times[:start_time] < time_range[1] && event_times[:end_time] > time_range[0]
    end

    return true unless occurrences.empty?

    false
  end
end
