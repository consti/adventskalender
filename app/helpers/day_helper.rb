module DayHelper
  def day_box(image: nil, date: nil, height: nil, width: nil)
    if day = Day.opened.find_by(date: Date.parse(date))
      day.image = image
      day.height = height
      day.width = width
      render day
    else
      content_tag 'td', class: 'disabled', :"data-until" => (Date.parse(date) - Date.today).to_i do
        image_tag(image, height: height, width: width)
      end
    end
  end

  def zindex_from_filename(filename)
    100 - filename.match(/(\d\d)\.jpg/)[1].to_i
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
