ActiveAdmin.register Kalender do
  permit_params :prize_id, :number

  index do
    id_column
    column :number
    column :day do |object|
      link_to(
        object.day.name,
        admin_day_path(object.day)
      )
    end
    column :prize do |object|
      link_to(object.prize.name, admin_prize_path(object.prize))
    end
    column :sponsor do |object|
      link_to(
        object.sponsor.name,
        admin_sponsor_path(object.sponsor)
      )
    end
    actions
  end


  csv do
    column(:datum) { |kalender| kalender.day.date }
    column(:sponsor) { |kalender| kalender.sponsor.name }
    column(:gewinn) { |kalender| kalender.prize.name }
    column(:kalender) { |kalender| kalender.number }
  end

end
