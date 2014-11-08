ActiveAdmin.register Sponsor do

  permit_params :name, :person, :address, :city, :phone, :logo, :logo_cache, :email

  index do
    id_column
    column :name
    column :person
    column :address
    column :city
    column :phone
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
      f.input :name
      f.input :person
      f.input :address
      f.input :city
      f.input :phone
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
