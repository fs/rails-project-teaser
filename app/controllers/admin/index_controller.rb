class Admin::IndexController < Admin::BaseController    
    

    public
    
	def index
        @pages = Page.recent.limit(10)
        @areas = EditableArea.recent.limit(10)
	end
	
end
