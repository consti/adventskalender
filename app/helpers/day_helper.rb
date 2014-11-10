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

  def zindex_from_filename(filename)
    100 - filename.match(/(\d\d)\.jpg/)[1].to_i
  end
end
