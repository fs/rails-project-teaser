class Admin::EditableAreasController < Admin::BaseController

     before_filter :set_filter, :only => :index

     private

     def set_filter
         @filter = { :id => params[:editable_area_id]}.reject{|k,v| v.blank?}
     end

     public 

     # GET /admin/editable_areas
     # GET /admin/editable_areas.xml
     def index
         @editable_areas = EditableArea.recent.paginate(
             :page => params[:page], 
             :per_page => APP_CONFIG['per_page'],
             :conditions => @filter
         )

         respond_to do |format|
             format.html # index.html.erb
             format.xml  { render :xml => @editable_areas }
         end
     end

     # GET /admin/editable_areas/new
     # GET /admin/editable_areas/new.xml
     def new
         @editable_area = EditableArea.new

         respond_to do |format|
             format.html # new.html.erb
             format.xml  { render :xml => @editable_area }
         end
     end

     # GET /admin/editable_areas/1/edit
     def edit
         @editable_area = EditableArea.find(params[:id])
     end

     # POST /admin/editable_areas
     # POST /admin/editable_areas.xml
     def create
         @editable_area = EditableArea.new(params[:editable_area])

         respond_to do |format|
             if @editable_area.save
                 flash[:notice] = '&quot;Editable area&quot; was successfully created.'
                 format.html { redirect_to(admin_editable_areas_url) }
                 format.xml  { render :xml => @editable_area, :status => :created, :location => @editable_area }
             else
                 format.html { render :action => "new" }
                 format.xml  { render :xml => @editable_area.errors, :status => :unprocessable_entity }
             end
         end
     end

     # PUT /admin/editable_areas/1
     # PUT /admin/editable_areas/1.xml
     def update
         @editable_area = EditableArea.find(params[:id])

         respond_to do |format|
             if @editable_area.update_attributes(params[:editable_area])
                 flash[:notice] = '&quot;Editable area&quot; was successfully updated.'
                 format.html { redirect_to(admin_editable_areas_url) }
                 format.xml  { head :ok }
             else
                 format.html { render :action => "edit" }
                 format.xml  { render :xml => @editable_area.errors, :status => :unprocessable_entity }
             end
         end
     end

     # DELETE /admin/editable_areas/1
     # DELETE /admin/editable_areas/1.xml
     def destroy
         @editable_area = EditableArea.find(params[:id])
         @editable_area.destroy

         respond_to do |format|
             format.html { redirect_to(admin_editable_areas_url) }
             format.xml  { head :ok }
         end
     end
end
