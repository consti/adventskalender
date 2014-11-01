ActiveAdmin.register Prize do
  permit_params :sponsor_id, :day_id, :name

  index do
    id_column
    column :name
    column :day do |object|
      link_to(
        object.day.name,
        admin_day_path(object.day)
      )
    end
    column :kalender do |object|
      object.kalenders.map do |kalender|
        link_to(kalender.number, admin_kalender_path(kalender))
      end.join('<br>').html_safe
    end
    column :sponsor do |object|
      link_to(
        object.sponsor.name,
        admin_sponsor_path(object.sponsor)
      )
    end
    actions
  end

end
