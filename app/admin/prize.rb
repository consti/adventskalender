ActiveAdmin.register Prize do
  permit_params :sponsor_id,
                :day_id,
                :name,
                :anzahl,
                :lions_member,
                kalenders_attributes: [:number, :id]

  (2014..Time.now.year).map(&:to_s).each do |year|
    scope(year, default: (year == Time.now.year)) do |scope|
      scope.year(year)
    end
  end

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
    column :lions_member
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs 'Preis' do
      f.input :name
      f.input :sponsor, as: :select, collection: Sponsor.all.order(name: :asc)
      f.input :day
      f.input :anzahl,
              as: :select,
              collection: options_for_select([*1..20], f.object.anzahl),
              include_blank: false
      f.has_many :kalenders, heading: 'Kalender (Gewinnnummern)' do |a|
        a.input :number
      end
      f.input :lions_member
    end
    f.actions
  end

  controller do
    def create
      create! do |format|
        format.html { redirect_to action: :new } if resource.valid?
      end
    end
  end

  csv do
    column(:datum) { |prize| prize.day.date }
    column(:sponsor) { |prize| prize.sponsor.name }
    column(:gewinn) { |prize| prize.name }
    column(:gewinnanzahl) { |prize| prize.anzahl }
    column(:kalenders) { |prize| prize.kalenders.map(&:number).join('; ') }
  end
end
