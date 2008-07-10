module Admin::BaseHelper
	def active_top_menu
		:index
	end

	def active_sub_menu
		:index
	end	

    def option_selector(model_name, options = {}, html_options = {})
        options      = default_options(model_name).update(options)
        html_options = default_html_options.update(html_options)

        unless options[:empty_line].blank?
            options[:choices] << '<option value=''>' + options[:empty_line] + '</option>'
        end

        model = model_name.to_s.classify.constantize
        options[:choices] << options_for_select(
                model.find(:all, options[:search]).to_dropdown(*options[:to_dropdown]),
                params[options[:option_name].to_sym].to_i
        )
        render_option_selector(options, html_options)
    end
    
    private

    def default_options(model_name)
        {   
            :option_name        =>  "#{model_name.to_s}_id".to_sym,
            :to_dropdown        => [:name, :id],
            :empty_line         => '',
            :choices            => ''
        }
    end

    def default_html_options
        { 
            :class  => "fr", 
            :style  =>"margin: -35px 0 10px 0;" 
        }
    end

    def render_option_selector(options, html_options)
        render :partial => 'admin/shared/option_selector', 
            :locals => { :options => options, :html_options => html_options }
=begin
        html = content_tag(:div, html_options) do 
            content_tag(:form, :action => options[:path], :method => :get) do
                 select_tag(
                        options[:option_name],
                        options[:choices],
                        :onchange => 'this.form.submit(); return false;'
                ) 
            end
        end 
        html << content_tag(:div, '',{ :class => 'clear' })
=end
    end

end
