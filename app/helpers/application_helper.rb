module ApplicationHelper
  def link_to_add_fields(name, f, association, org_type)
    new_object = f.object.send(association).klass.new
    new_object.org_type = org_type
    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
