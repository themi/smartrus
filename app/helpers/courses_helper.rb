module CoursesHelper

  def ancestor_breadcrumbs_for(item)
    content_tag(:nav, "aria-label": "breadcrumb") do
      concat(
        content_tag(:ol, class: "breadcrumb") do
          item.ancestors.each do |parent|
            concat content_tag(:li, link_to(parent.prefix, parent), class: "breadcrumb-item")
          end
        end
      )
    end
  end

  def descendant_list_for(parent_item)
    content_tag :ul do
      parent_item.children.each do |child|
        concat content_tag(:li, link_to(child.prefix, child))
        concat descendant_list_for(child)
      end
    end
  end

end
