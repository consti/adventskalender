module DayHelper
  def day_box(image: nil, date: nil, height: nil, width: nil)
    if day = Day.opened.find_by(date: Date.parse(date))
      day.image = image
      day.height = height
      day.width = width
      render day
    else
      content_tag 'td', class: 'disabled' do
        image_tag(image, height: height, width: width)
      end
    end

  end
end
