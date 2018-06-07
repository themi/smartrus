Rails.application.routes.draw do

  # ==== admins routes ====

  devise_for :admins, path: "admins", controllers: {
    confirmations: "admins/devise/confirmations",
    passwords: "admins/devise/passwords",
    registrations: "admins/devise/registrations",
    sessions: "admins/devise/sessions",
  }

  authenticated :admin do
    root "admins/dashboard#index", as: :root_authenticated_admin
  end

  namespace :admins do
    get "dashboard/index"
  end

  # ==== supervisors routes ====

  devise_for :supervisors, path: "supervisors", controllers: {
    confirmations: "supervisors/devise/confirmations",
    passwords: "supervisors/devise/passwords",
    registrations: "supervisors/devise/registrations",
    sessions: "supervisors/devise/sessions",
  }

  authenticated :supervisor do
    root "supervisors/dashboard#index", as: :root_authenticated_supervisor
  end

  namespace :supervisors do
    get "dashboard/index"
  end

  # ==== students routes ====

  devise_for :students, path: "students", controllers: {
    confirmations: "students/devise/confirmations",
    passwords: "students/devise/passwords",
    registrations: "students/devise/registrations",
    sessions: "students/devise/sessions",
  }

  authenticated :student do
    root "students/dashboard#index", as: :root_authenticated_student
  end

  namespace :students do
    get "dashboard/index"
  end

  resources :definitions
  resources :courses

  get "pages/demokit"

  root "pages#home"
end
