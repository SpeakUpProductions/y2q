ActiveAdmin.register Video do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
      f.inputs "Video" do
        f.input :title, :input_html => { :disabled => true }
        f.input :heartbreak,
                :label => "What breaks your heart?",
                :member_label => :display_text,
                :input_html => { :disabled => true }
        f.input :inspiration,
                :label => "What makes you come alive?",
                :member_label => :display_text,
                :input_html => { :disabled => true }

      end
      f.actions
    end

  index :as => :block do |video|
    div :for => video do
      render "index_video", video: video
      div do
      end
    end
  end
end
