class Admin::AccountsController < Admin::BaseController

    def show
        @account = current_account.clone

        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @account }
        end
    end

    def edit
        @account = current_account.clone
    end

    def update
        @account = Account.find(params[:id])

        respond_to do |format|
            if @account.update_attributes(params[:account])
                flash[:notice] = '&quot;Account&quot; was successfully updated.'
                format.html { redirect_to(admin_account_url()) }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
            end
        end
    end
end
