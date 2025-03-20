require 'redmine'

Rails.application.config.to_prepare do
  IssuesController.class_eval do
    before_action :add_watchers_based_on_category, only: [:create, :update]

    private

    def add_watchers_based_on_category
      return unless params[:issue] && params[:issue][:category_id]
      
      category_id = params[:issue][:category_id]
      watchers = CategoryWatcher.where(category_id: category_id).pluck(:user_id)
      
      @issue ||= Issue.new
      @issue.watcher_user_ids |= watchers
    end
  end
end

Redmine::Plugin.register :auto_watchers do
  name 'Auto Watchers Plugin'
  author 'Tu Nombre'
  description 'Asigna automáticamente seguidores basados en la categoría seleccionada'
  version '0.1.0'
  requires_redmine version_or_higher: '4.0.0'
end
