$('.key-gen').html("<%= j render('load_link') %>");
$('#master_key').val('<%= session[:master_key_tmp] %>');