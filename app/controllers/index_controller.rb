class IndexController < BaseController

    def index
        raise "IndexController#index"
        respond_to do |format|
            format.html # index.html.erb
            format.xml  
        end
    end

end
