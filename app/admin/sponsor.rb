ActiveAdmin.register Sponsor do
  permit_params :name, :person, :address, :city, :phone, :logo, :logo_cache, :email, :fax, :year

  (2014..Time.now.year).map(&:to_s).each do |year|
    scope(year, default: (year == Time.now.year)) do |scope|
      scope.where(year: year)
    end
  end

  index do
    id_column
    column :year
    column :name
    column :person
    column :address
    column :city
    column :phone
    column :fax
    column :email
    column :logo do |object|
      image_tag(object.logo.url(:thumb))
    end
    column :prizes do |object|
      link_to(
        pluralize(object.prizes.count, "Prize"),
        admin_prizes_path(q: { sponsor_id_eq: object.id })
      )
    end
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors
    f.inputs 'Sponsor' do
      f.input :year
      f.input :name
      f.input :person
      f.input :address
      f.input :city
      f.input :phone
      f.input :fax
      f.input :email
      f.input :logo,
              as: :file,
              hint: if f.object.logo.present?
                      image_tag(f.object.logo.url(:prize))
                    else
                      content_tag(:span, "no logo yet")
                    end
      f.input :logo_cache, :as => :hidden
    end
    f.actions
  end
end
