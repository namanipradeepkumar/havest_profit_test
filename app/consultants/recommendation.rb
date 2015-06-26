ActiveAdmin.register Recommendation, namespace: :consultants do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :body, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :body
    column :user_id
    actions
  end

  form do |f|
    inputs 'Details' do
      input :user_id, as: :select, collection: User.all.map{|user| [user.display_name, user.id]}
      input :body
    end
    actions
  end

  show do
    div do
      markdown(recommendation.body)
    end
  end

end
