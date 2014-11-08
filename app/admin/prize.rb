ActiveAdmin.register Prize do
  permit_params :sponsor_id, :day_id, :name, :anzahl

  index do
    id_column
    column :name
    column :anzahl
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

  form do |f|
    f.semantic_errors
    f.inputs 'Prize' do
      f.input :sponsor, as: :select, collection: Sponsor.all.order(name: :asc)
      f.input :day
      f.input :anzahl,
              as: :select,
              collection: options_for_select([*1..20], f.object.anzahl),
              include_blank: false
      f.input :name
    end
    f.actions
  end
end
