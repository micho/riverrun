<% if params[:mode] == "work" %>

  $("td#<%= @piece.id %>").html("<%=h @piece.text %>")
  $("td#ago_<%= @piece.id %>").html("<%=h time_ago_in_words @piece.updated_at %>")

  <% if @piece.updated_at > 30.seconds.ago %>
    $("td#<%= @piece.id %>").closest("tr").addClass("updated")
  <% else %>
    $("td#<%= @piece.id %>").closest("tr").removeClass("updated")
  <% end %>

<% elsif params[:mode] == "edit" %>

  $("input#<%= @piece.id %>").val("<%=h @piece.text %>")

  <% if @piece.updated_at > 30.seconds.ago %>
    $("input#<%= @piece.id %>").addClass("updated")
  <% else %>
    $("input#<%= @piece.id %>").removeClass("updated")
  <% end %>
  

<% end %>