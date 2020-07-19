require 'active_support'
require 'active_support/core_ext'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def date_advance(date, num)
      if @period == 'monthly'
        date.advance(months: @interval * num)
      elsif @period == 'weekly'
        date.advance(weeks: @interval * num)
      elsif @period == 'daily'
        date.advance(days: @interval * num)
    end
  end

  def match(date)
    current = @start
    i = 0
      while current <= date
        if current == date
          return true
        end
        current = date_advance(@start, i)
        i+=1
      end
      return false
  end

end
