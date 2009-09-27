class GigsController < InheritedResources::Base
  respond_to :html, :xml, :js
  actions :index, :show
end
