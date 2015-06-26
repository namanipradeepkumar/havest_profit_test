ActiveAdmin.register User, namespace: :admins do

  filter :name
  filter :cell_phone
  filter :email
  filter :consultant, collection: Consultant.all.map{|consultant| [consultant.email, consultant.id] }

  permit_params :name, :email, :cell_phone, :password, :consultant_id

  index do
    column :name
    column :email
    column :cell_phone
    column(:consultant) {|user| Consultant.find(user.consultant_id).email unless user.consultant_id.blank? }
    actions
  end

  form do |f|
    inputs 'Details' do
      input :name
      input :email
      input :cell_phone
      input :password
      input :consultant_id, as: :select, collection: Consultant.all.map{|consultant| [consultant.email, consultant.id] }
    end
    actions
  end
end
