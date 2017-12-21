module WorkingHoursConcern
  DEFAULT_WORKING_HOURS = Date::ABBR_DAYNAMES.inject({}) { |working_hours, day|
    working_hours.merge({day.downcase => {'00:00' => '01:00', '10:00' => '24:00'}})
  }.freeze

  def working_day?(datetime)
    date_working_hours(datetime).present?
  end

  def in_working_hours?(datetime)
    return false unless working_day?(datetime)
    time = datetime.strftime('%H:%M')

    date_working_hours(datetime).each { |from, to|
      return true if (from..to).include?(time)
    }

    false
  end

  def date_working_hours(datetime)
    JSON.parse(working_hours[datetime.strftime('%a').downcase].gsub("=>", ":"))
  end
end