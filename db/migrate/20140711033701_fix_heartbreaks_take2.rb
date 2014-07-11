class FixHeartbreaksTake2 < ActiveRecord::Migration

  def down
    Heartbreak.delete_all()
    Heartbreak.create(display_text: "Education")
    Heartbreak.create(display_text: "Human Rights")
    Heartbreak.create(display_text: "Nutrition & Water Crisis")
    Heartbreak.create(display_text: "Physical/Mental Health")
    Heartbreak.create(display_text: "Poverty")
    Heartbreak.create(display_text: "Violence/Abuse")
    Heartbreak.create(display_text: "War/Genocide")
  end

  def up
    Heartbreak.delete_all()
    Heartbreak.create(display_text: "Human Rights")
    Heartbreak.create(display_text: "Poverty")
    Heartbreak.create(display_text: "Animal/Environment")
    Heartbreak.create(display_text: "War/Genocide")
    Heartbreak.create(display_text: "Health")
    Heartbreak.create(display_text: "Education")
    Heartbreak.create(display_text: "Violence/Abuse")
  end

end
