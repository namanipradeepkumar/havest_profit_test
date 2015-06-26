ActiveAdmin.register Consultant, namespace: :admins do

  filter :email

  permit_params :email, :password

  index do
    column :email
    actions
  end

  form do |f|
    inputs 'Details' do
      input :email
      input :password
    end
    actions
  end

end
