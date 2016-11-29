# == Route Map
#
#                    Prefix Verb   URI Pattern                                  Controller#Action
#               rails_admin        /dashboard                                   RailsAdmin::Engine
#         new_admin_session GET    /admins/sign_in(.:format)                    devise/sessions#new
#             admin_session POST   /admins/sign_in(.:format)                    devise/sessions#create
#     destroy_admin_session DELETE /admins/sign_out(.:format)                   devise/sessions#destroy
#            admin_password POST   /admins/password(.:format)                   devise/passwords#create
#        new_admin_password GET    /admins/password/new(.:format)               devise/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format)              devise/passwords#edit
#                           PATCH  /admins/password(.:format)                   devise/passwords#update
#                           PUT    /admins/password(.:format)                   devise/passwords#update
# cancel_admin_registration GET    /admins/cancel(.:format)                     devise/registrations#cancel
#        admin_registration POST   /admins(.:format)                            devise/registrations#create
#    new_admin_registration GET    /admins/sign_up(.:format)                    devise/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)                       devise/registrations#edit
#                           PATCH  /admins(.:format)                            devise/registrations#update
#                           PUT    /admins(.:format)                            devise/registrations#update
#                           DELETE /admins(.:format)                            devise/registrations#destroy
#              course_posts GET    /courses/:course_id/posts(.:format)          posts#index
#                           POST   /courses/:course_id/posts(.:format)          posts#create
#           new_course_post GET    /courses/:course_id/posts/new(.:format)      posts#new
#          edit_course_post GET    /courses/:course_id/posts/:id/edit(.:format) posts#edit
#               course_post GET    /courses/:course_id/posts/:id(.:format)      posts#show
#                           PATCH  /courses/:course_id/posts/:id(.:format)      posts#update
#                           PUT    /courses/:course_id/posts/:id(.:format)      posts#update
#                           DELETE /courses/:course_id/posts/:id(.:format)      posts#destroy
#                   courses GET    /courses(.:format)                           courses#index
#                           POST   /courses(.:format)                           courses#create
#                new_course GET    /courses/new(.:format)                       courses#new
#               edit_course GET    /courses/:id/edit(.:format)                  courses#edit
#                    course GET    /courses/:id(.:format)                       courses#show
#                           PATCH  /courses/:id(.:format)                       courses#update
#                           PUT    /courses/:id(.:format)                       courses#update
#                           DELETE /courses/:id(.:format)                       courses#destroy
#         create_subscriber POST   /courses/:course_id/subscribe(.:format)      subscribers#create
#                      root GET    /                                            pages#index
#               subscribers GET    /subscribers(.:format)                       subscribers#index
#         ahoy_email_engine        /ahoy                                        AhoyEmail::Engine
#                refile_app        /attachments                                 #<Refile::App app_file="/Users/afeldman/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/bundler/gems/refile-d7a42dcd7cf6/lib/refile/app.rb">
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
#
# Routes for AhoyEmail::Engine:
#  open_message GET  /messages/:id/open(.:format)  ahoy/messages#open
# click_message GET  /messages/:id/click(.:format) ahoy/messages#click
#

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  devise_for :admins
  resources :courses do
    resources :posts
  end
  post '/courses/:course_id/subscribe', to: 'subscribers#create', as: 'create_subscriber'
  root to: 'pages#index'
  get 'subscribers', to: 'subscribers#index'
end
