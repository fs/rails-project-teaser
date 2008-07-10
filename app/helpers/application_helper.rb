# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

    private

    def default_metadata
        {
            :keywords    => "Default meta keywords. Please, change it in ApplicationHelper::default_metadata.",
            :description => "Default meta description. Please, change it in ApplicationHelper::default_metadata."
        }
    end

    public 

    def show_metadata(meta = nil)
        meta = (meta && meta.class.to_s[/Hash/]) ?  default_metadata.update(meta) : default_metadata
        render :partial => 'layouts/metadata', :locals => { :meta => meta }
    rescue
        ''
    end

    def show_messages
        render :partial => 'layouts/messages'
    end

    def show_title(title = nil)
        default_title = 'Default title. Please, change it in ApplicationHelper::show_title'
        content_tag(:title, {}) do
            if title.blank?
                default_title
            else
                title
            end
        end
    end

    def editable_area(name)
        EditableArea.find_by_name(name).html
    rescue
        '<!-- editable area bad or not found -->'
    end
end
