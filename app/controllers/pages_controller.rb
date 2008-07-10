class PagesController < BaseController

    def show
        url = params[:url].join('/')

        @page = Page.find_by_url(url) || raise(ActiveRecord::RecordNotFound)

        @meta  = @page.meta_data
    end
end
