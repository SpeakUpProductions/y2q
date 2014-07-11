class FixHeartbreaks < ActiveRecord::Migration

  def down
    Heartbreak.delete_all()
    Heartbreak.create(display_text: "Human Rights")
    Heartbreak.create(display_text: "Poverty")
    Heartbreak.create(display_text: "Animal/Environment")
    Heartbreak.create(display_text: "War/Genocide")
    Heartbreak.create(display_text: "Health")
    Heartbreak.create(display_text: "Education")
    Heartbreak.create(display_text: "Violence/Abuse")
  end

  def up
    Inspiration.delete_all()
    Inspiration.create(display_text: "Politics")
    Inspiration.create(display_text: "Education")
    Inspiration.create(display_text: "Activism")
    Inspiration.create(display_text: "Arts & Culture")
    Inspiration.create(display_text: "Humanitarian")
    Inspiration.create(display_text: "Business")
    Inspiration.create(display_text: "Science")
  end

end
