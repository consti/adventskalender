ActiveAdmin.register Day do
  permit_params :date

  index do
    id_column
    column :date
    column :kalender do |object|
      object.kalenders.map do |kalender|
        link_to(kalender.number, admin_kalender_path(kalender))
      end.join('<br>').html_safe
    end
    column :prizes do |object|
      object.prizes.map do |prize|
        link_to(
          prize.name,
          admin_prize_path(prize)
        )
      end.join('<br>').html_safe
    end
    column :sponsors do |object|
      object.sponsors.map do |sponsor|
        link_to(
          sponsor.name,
          admin_sponsor_path(sponsor)
        )
      end.join('<br>').html_safe
    end
    actions
  end

end
