module ProductsHelper
  
  def list_of_users
    # User.order('last_name, first_name').collect {|u| [ u.last_name + ', ' + u.first_name  + ' - ' + u.email, u.id]}
    User.order('last_name, first_name')
  end
  
  def list_of_ticket_projects
    Ticket.projects().collect {|p| [p[:name], p[:id]]}
  end

  def ticket_project_name(id)
    ids = []
    if(id.present?)
      ids.push(id.to_s)
      ticket_product = Ticket.projects_info(ids)
      ticket_product[id]
    else
      ticket_product[id][:name] = ""
      ticket_product[id][:description] = ""
      ticket_product[id]
    end
  end

  def format_project_description(description)
    if (description.present?)
      description.gsub(description[/\*(.*?)\*/],
        "<b>" + description[/\*(.*?)\*/, 1] + "</b>").gsub(description[/!(.*?)!/],
        "<img src=\"" + description[/!(.*?)!/, 1] + "\" />")
    else
      ""
    end
  end
end
