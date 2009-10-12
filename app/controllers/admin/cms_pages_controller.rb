class Admin::CmsPagesController < AdminController
  admin_assistant_for CmsPage do |aa|
    aa.form do |form|
      form.columns :reference_string, :title, :sub_titile, :sub_title_url, :body, :meta_keyword, :meta_description
    end

    aa.index do |index|
      index.columns :reference_string, :title, :sub_titile, :sub_title_url, :body, :meta_keyword, :meta_description
    end
  end
end