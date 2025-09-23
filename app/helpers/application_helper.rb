module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

    arrow = ""
    if column == sort_column
      arrow = sort_direction == "asc" ? " ↑" : " ↓"
    end

    link_to "#{title}#{arrow}".html_safe, request.params.merge(sort: column, direction: direction, page: nil)
  end

  def sort_column
    %w[first_name last_name species gender weapon vehicle].include?(params[:sort]) ? params[:sort] : "first_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
