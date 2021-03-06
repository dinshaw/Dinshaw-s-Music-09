class Admin::CmsPagesController < AdminController
  cache_sweeper :cms_page_sweeper, :only => [:create, :update, :destroy]
  
  admin_assistant_for CmsPage do |aa|
    aa.form do |form|
      form.columns :reference_string, :title, :body, :meta_keyword, :meta_description
      form[:body ].text_area_options = {:rows => 2}
      form[:meta_description ].text_area_options = {:rows => 5}
      form[:meta_keyword ].text_area_options = {:rows => 5}      
    end

    aa.index do |index|
      index.columns :reference_string, :title, :meta_keyword, :meta_description
    end
  end
  
  def show
    @cms_page = CmsPage.find(params[:id])
  end
end