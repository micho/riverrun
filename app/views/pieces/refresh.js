<% if @piece.user or @piece.text %>
  <% if params[:mode] == "work" %>

    $("td#<%= @piece.id %>").html("<%=h @piece.text %>")

    tr = $("td#<%= @piece.id %>").closest("tr")
    tr.find("#ago").html("<%=h time_ago_in_words @piece.updated_at %>")
    tr.find("#author").html("<%=h @piece.user ? @piece.user.username : t('.unassigned') %>")

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
<% end %>