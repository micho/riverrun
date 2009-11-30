$("td#<%= @piece.id %>").html("<%=h @piece.text %>")
$("td#ago_<%= @piece.id %>").html("<%=h time_ago_in_words @piece.updated_at %>")

<% if @piece.updated_at > 30.seconds.ago %>
  $("td#<%= @piece.id %>").closest("tr").addClass("updated")
<% else %>
  $("td#<%= @piece.id %>").closest("tr").removeClass("updated")
<% end %>
