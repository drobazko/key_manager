$(".errors")
.html('<%= @category.errors.full_messages.join %>')
.show()
.delay(3000)
.fadeOut(400)

