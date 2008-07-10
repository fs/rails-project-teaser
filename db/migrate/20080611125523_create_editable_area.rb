class CreateEditableArea < ActiveRecord::Migration

DEFAULT_HEADER = %q{
<div class="header">
    <div class="header-img">
        <div class="container" style="margin: 0 auto auto; position:relative;">
            <div style="position: absolute; top: 10px; left: 0;">
                <a href="/"><img src="/images/user/0.gif" width="242" height="106" /></a>
            </div>
        <div class="span-24" style="text-align: right;">
            <a title="Log-In" class="login-link" href="https://studio.youdesignit.com/youdesignit.cfm?Login=1">Log-In</a>
        </div>
    </div>
</div>
}

DEFAULT_FOOTER = %q{
<div class="footer">
    <ul class="links">
        <li><a rel="nofollow" href="/about">About us</a></li>
        <li><a rel="nofollow" href="/contact">Contact us</a></li>
        <li><a rel="nofollow" href="/terms">Terms & Conditions</a></li>
        <li><a rel="nofollow" href="/policy">Privacy policy</a></li>
        <li><a rel="nofollow" href="/pricing">Pricing</a></li>
        <li><a href="/sitemap">Sitemap</a></li>
    </ul>
    All rights reserved 2007-2008
</div>
}

DEFAULT_ANALYTICS = %q{
<!-- Google analytics -->
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript">
        _uacct = "UA-123456-789";
        urchinTracker();
    </script>
<!-- / Google analytics -->
}

DEFAULT_INDEX_MAIN = %q{
<div class="content">
</div>
}

DEFAULT_INDEX_HEAD = %q{
<title>T-Shirt Screen Printing, Custom T Shirt Design, Design Your Own Hats, Tshirt Screenprinting</title>
    <meta name="description" content="Custom design t shirts online. T-Shirt Screen Printing at low prices and high quality. Fast and easy with free shipping. Get all of your t shirt printing at You Design It." />
    <meta name="keywords" content="T-Shirt Screen Printing, Custom T Shirt Design, design t shirt, custom hats, custom ball caps, create your own t shirt, personalized t shirts, design own t shirt, screen printed tee shirts, printed tshirts" />
}
    DEFAULT_EDITABLE_AREAS = {
        "header"        => DEFAULT_HEADER, 
        "footer"        => DEFAULT_FOOTER, 
        "analytics"     => DEFAULT_ANALYTICS, 
        "index.main"    => DEFAULT_INDEX_MAIN, 
        "index.head"    => DEFAULT_INDEX_HEAD
    }

    def self.up
        create_table :editable_areas do |t|
            t.string    :name
            t.text      :html, :description

            t.datetime  :deleted_at
            t.timestamps
        end

        DEFAULT_EDITABLE_AREAS.each do |area_name, area_content|
            area = EditableArea.new(
                :name => area_name,
                :description => "Code for #{area_name} editable area",
                :html   => area_content
            )
            # area_name - is protected attribute
            area.name = area_name
            area.save
        end
    end

    def self.down
        drop_table :editable_areas
    end
end
