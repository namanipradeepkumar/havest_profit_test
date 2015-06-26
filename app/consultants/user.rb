ActiveAdmin.register User, namespace: :consultants do

  scope("My users", default: true) { current_consultant.users }

  filter :name
  filter :cell_phone
  filter :email

  permit_params :name, :email, :cell_phone, :password, :consultant_id

  index do
    column :name
    column :email
    column :cell_phone
    actions
  end

  form do |f|
    inputs 'Details' do
      input :name
      input :email
      input :cell_phone
      input :password
      input :consultant_id, input_html: { value: current_consultant.id }, as: :hidden
    end
    actions
  end
end
