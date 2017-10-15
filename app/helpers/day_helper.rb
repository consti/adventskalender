module DayHelper
  BOLD_DAYS     = [24]
  DARKENED_DAYS = [28, 21, 2, 24, 14, 6, 11, 18, 5, 22]

  def day_box(image: nil, date: nil, height: nil, width: nil, rowspan: nil)
    date = Date.parse(date)
    if day = Day.year(ENV['YEAR']).opened.find_by(date: date)
      day.image = image
      day.height = height
      day.width = width
      day.rowspan = rowspan
      render day
    else
      content_tag 'td', rowspan: rowspan, class: 'disabled', :"data-until" => (date - Date.today).to_i do
        safe_join [
          date_on_door(date),
          image_tag(image, height: height, width: width)
        ]
      end
    end
  end

  def zindex_from_filename(filename)
    100 - filename.match(/(\d\d)\.jpg/)[1].to_i
  end

  def date_on_door(date)
    day = date.day
    klass = ['date-on-door']
    klass << 'bold' if day.in? BOLD_DAYS
    klass << 'darken' if day.in? DARKENED_DAYS
    content_tag('div', day, class: klass)
  end

  def kalender_numbers(numbers)
    numbers.sort.map do |number|
      content_tag('span', number, class: 'prize-number')
    end.join(', ').html_safe
  end

  def sponsor_contact(sponsor)
    contact = "Abzuholen bei: "
    contact += [content_tag('b', sponsor.name),
                sponsor.address,
                sponsor.city,
                "Tel.: #{sponsor.phone}"].join(", ")
    if sponsor.person.present?
      contact += ";<br>Ihr Ansprechpartner: #{sponsor.person}"
    end
    contact.html_safe
  end
end
