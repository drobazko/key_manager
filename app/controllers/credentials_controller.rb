class CredentialsController < ApplicationController
  before_filter :authenticate_user!, :load_key!, :default_category

  def index
    @credentials = current_user.credentials
    @credentials = @credentials.where(category_id: params[:cat]) unless params[:cat] == 'all'
  end

  def show
    @credential = current_user.credentials.find(params[:id])
    @credential.encryption_key = session[:master_key]
  end

  def new
    @credential = current_user.credentials.new
  end

  def create
    @credential = current_user.credentials.new
    @credential.encryption_key = session[:master_key]
    @credential.update(credential_params)
    
    if @credential.save
      redirect_to credential_path(@credential), notice: "Password entry created successfully."
    else
      render "new"
    end
  end

  def edit
    @credential = current_user.credentials.find(params[:id])
    @credential.encryption_key = session[:master_key]
  end

  def update
    @credential = current_user.credentials.find(params[:id])
    @credential.encryption_key = session[:master_key]

    if @credential.update(credential_params)
      redirect_to credential_path(@credential), notice: "Password entry changed successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @credential = current_user.credentials.find(params[:id])
    @credential.destroy
    redirect_to credentials_path, notice: "Password Entry was removed successfully"
  end

  def open_link
    @credential = current_user.credentials.find(params[:id])
    @credential.encryption_key = session[:master_key]
   
    result = open_url
    if result.class == String
      redirect_to credential_path(@credential), notice: "Redirect Link Failed: #{result}"
    else
      render html: "#{result.body}".html_safe
    end
  end

  # GET /credentials/export.format
  def export
    @credentials = current_user.credentials
    @credentials = @credentials.where(category_id: params[:cat]) unless params[:cat] == 'all'
    @credentials.each{|c| c.encryption_key = session[:master_key]}

    respond_to do |format|
      format.csv  { render csv: @credentials, only: [:name, :login, :password] }
      format.pdf { send_data ExportPdf.new(@credentials, session[:master_key]).render, filename: 'key_export.pdf' }
    end
  end

  private

    def generate_url(url, params = {})
      uri = URI(url)
      uri.query = params.to_query
      uri.to_s
    end

    def credential_params
      params[:credential].delete_if {|k,v| v.blank?}
      params.require(:credential).permit(:name, :login, :password, :link, :comment, :expiration_date, :category_id)
    end

    def default_category
        params[:cat] ||= "all"
    end

    def open_url
      begin
        agent = Mechanize.new
        agent.user_agent_alias = 'Windows Mozilla'

        page = agent.get(@credential.link)
        
        #page.encoding = 'utf-8'
        form = page.forms.first
        form.field_with(name: /pass/i).value = @credential.password
        form.field_with(name: /login|username|email/i).value = @credential.login
        
        page = form.submit
        
      rescue Exception => e
        e.message
      end
     
    end

end
