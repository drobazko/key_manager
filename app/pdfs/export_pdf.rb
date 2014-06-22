class ExportPdf < Prawn::Document
  def initialize(credentials, mk)
    super()
    @credentials = credentials
    @mk = mk
   
    text_content
  end
 
  def text_content
    text "Passwords", size: 20, style: :bold
    move_down 20

    @credentials.each do |c|
      c.encryption_key = @mk

      text "Name", size: 15, style: :bold
      text c.name

      text "Login", size: 15, style: :bold
      text c.login

      text "Password", size: 15, style: :bold
      text c.password

      move_down 30
    end
  end

end