ActiveAdmin.register Developer do
  menu priority: 20, label: "Help Wanted"

  index do
    column :name
    column :email
    column :comments
  end
end
