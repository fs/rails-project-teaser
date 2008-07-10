class Admin::PagesController < Admin::BaseController

    before_filter :set_filter, :only => :index

     private

     def set_filter
         @filter = { :id => params[:page_id]}.reject{|k,v| v.blank?}
     end

     public 

     # GET /admin/pages
     # GET /admin/pages.xml
     def index
         @pages = Page.recent.paginate(
             :page => params[:page], 
             :conditions => @filter,
             :per_page => APP_CONFIG['per_page']
         )

         respond_to do |format|
             format.html # index.html.erb
             format.xml  { render :xml => @pages }
         end
     end

     # GET /admin/pages/new
     # GET /admin/pages/new.xml
     def new
         @page = Page.new

         respond_to do |format|
             format.html # new.html.erb
             format.xml  { render :xml => @page }
         end
     end

     # GET /admin/pages/1/edit
     def edit
         @page = Page.find(params[:id])
     end

     # POST /admin/pages
     # POST /admin/pages.xml
     def create
         @page = Page.new(params[:page])

         respond_to do |format|
             if @page.save
                 flash[:notice] = '&quot;Page&quot; was successfully created.'
                 format.html { redirect_to(admin_pages_url) }
                 format.xml  { render :xml => @page, :status => :created, :location => @page }
             else
                 format.html { render :action => "new" }
                 format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
             end
         end
     end

     # PUT /admin/pages/1
     # PUT /admin/pages/1.xml
     def update
         @page = Page.find(params[:id])

         respond_to do |format|
             if @page.update_attributes(params[:page])
                 flash[:notice] = '&quot;Page&quot; was successfully updated.'
                 format.html { redirect_to(admin_pages_url) }
                 format.xml  { head :ok }
             else
                 format.html { render :action => "edit" }
                 format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
             end
         end
     end

     # DELETE /admin/pages/1
     # DELETE /admin/pages/1.xml
     def destroy
         @page = Page.find(params[:id])
         @page.destroy

         respond_to do |format|
             format.html { redirect_to(admin_pages_url) }
             format.xml  { head :ok }
         end
     end
end
