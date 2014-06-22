$('.msg')
.html("<%= j render(partial: '/shared/errors', locals: {entity: @key}) %>")
.show()
.delay(3000)
.fadeOut(400); 