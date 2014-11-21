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
      object.prizes.sort_by(&:sponsor_id).map do |prize|
        link_to(
          prize.name,
          admin_prize_path(prize)
        )
      end.join('<br>').html_safe
    end
    column :sponsors do |object|
      object.sponsors.sort_by(&:id).map do |sponsor|
        link_to(
          sponsor.name,
          admin_sponsor_path(sponsor)
        )
      end.join('<br>').html_safe
    end
    actions
  end

  collection_action :download_gesamtliste, :method => :get do
    days = Day.all.order(date: :asc).includes(:prizes, :kalenders, :sponsors)
    liste = CSV.generate do |csv|
      csv << [:tag, :sponsor, :gewinn, :anzahl, :kalender_nr]
      days.each_with_index do |day, index|
        day.prizes.each do |prize|
          prize.anzahl.times do |i|
            csv << [day.date, prize.sponsor.name, prize.name, prize.anzahl, prize.kalenders[i].try(:number)]
          end
        end
      end
    end
    # send file to user
    send_data(
      liste,
      type: 'text/csv; header=present',
      disposition: "attachment; filename=gesamtliste.csv")
  end

  action_item only: :index do
    link_to 'Gesamtliste herunterladen', params.merge(:action => :download_gesamtliste)
  end
end
