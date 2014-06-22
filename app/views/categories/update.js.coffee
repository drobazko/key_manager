$('#myModal').modal('toggle');
$('#edit_category_<%= @category.id %> .cat-title').html('<%= @category.title %>');

