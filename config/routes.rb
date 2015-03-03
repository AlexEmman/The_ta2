Rails.application.routes.draw do
  

  root to: 'teachers#index'
  resources :teachers
  resources :students
  resources :enrollments
  
  resources :courses do
    resources :students
    resources :teachers
  end
  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"


  get 'sessions/new'
  post "/sessions", to: "sessions#create"
  get "/sign_up", to: "teachers#new", as: "sign_up"

  get '/courses/add_student', to: 'courses#add_student'
  resources :sessions
  
  resources :points
end
#  Prefix Verb   URI Pattern                                     Controller#Action
#                root GET    /                                               teachers#index
#            teachers GET    /teachers(.:format)                             teachers#index
#                     POST   /teachers(.:format)                             teachers#create
#         new_teacher GET    /teachers/new(.:format)                         teachers#new
#        edit_teacher GET    /teachers/:id/edit(.:format)                    teachers#edit
#             teacher GET    /teachers/:id(.:format)                         teachers#show
#                     PATCH  /teachers/:id(.:format)                         teachers#update
#                     PUT    /teachers/:id(.:format)                         teachers#update
#                     DELETE /teachers/:id(.:format)                         teachers#destroy
#            students GET    /students(.:format)                             students#index
#                     POST   /students(.:format)                             students#create
#         new_student GET    /students/new(.:format)                         students#new
#        edit_student GET    /students/:id/edit(.:format)                    students#edit
#             student GET    /students/:id(.:format)                         students#show
#                     PATCH  /students/:id(.:format)                         students#update
#                     PUT    /students/:id(.:format)                         students#update
#                     DELETE /students/:id(.:format)                         students#destroy
#         enrollments GET    /enrollments(.:format)                          enrollments#index
#                     POST   /enrollments(.:format)                          enrollments#create
#      new_enrollment GET    /enrollments/new(.:format)                      enrollments#new
#     edit_enrollment GET    /enrollments/:id/edit(.:format)                 enrollments#edit
#          enrollment GET    /enrollments/:id(.:format)                      enrollments#show
#                     PATCH  /enrollments/:id(.:format)                      enrollments#update
#                     PUT    /enrollments/:id(.:format)                      enrollments#update
#                     DELETE /enrollments/:id(.:format)                      enrollments#destroy
#     course_students GET    /courses/:course_id/students(.:format)          students#index
#                     POST   /courses/:course_id/students(.:format)          students#create
#  new_course_student GET    /courses/:course_id/students/new(.:format)      students#new
# edit_course_student GET    /courses/:course_id/students/:id/edit(.:format) students#edit
#      course_student GET    /courses/:course_id/students/:id(.:format)      students#show
#                     PATCH  /courses/:course_id/students/:id(.:format)      students#update
#                     PUT    /courses/:course_id/students/:id(.:format)      students#update
#                     DELETE /courses/:course_id/students/:id(.:format)      students#destroy
#     course_teachers GET    /courses/:course_id/teachers(.:format)          teachers#index
#                     POST   /courses/:course_id/teachers(.:format)          teachers#create
#  new_course_teacher GET    /courses/:course_id/teachers/new(.:format)      teachers#new
# edit_course_teacher GET    /courses/:course_id/teachers/:id/edit(.:format) teachers#edit
#      course_teacher GET    /courses/:course_id/teachers/:id(.:format)      teachers#show
#                     PATCH  /courses/:course_id/teachers/:id(.:format)      teachers#update
#                     PUT    /courses/:course_id/teachers/:id(.:format)      teachers#update
#                     DELETE /courses/:course_id/teachers/:id(.:format)      teachers#destroy
#             courses GET    /courses(.:format)                              courses#index
#                     POST   /courses(.:format)                              courses#create
#          new_course GET    /courses/new(.:format)                          courses#new
#         edit_course GET    /courses/:id/edit(.:format)                     courses#edit
#              course GET    /courses/:id(.:format)                          courses#show
#                     PATCH  /courses/:id(.:format)                          courses#update
#                     PUT    /courses/:id(.:format)                          courses#update
#                     DELETE /courses/:id(.:format)                          courses#destroy
#        sessions_new GET    /sessions/new(.:format)                         sessions#new
#            sessions POST   /sessions(.:format)                             sessions#create
#             sign_up GET    /sign_up(.:format)                              teachers#new
# courses_add_student GET    /courses/add_student(.:format)                  courses#add_student
#                     GET    /sessions(.:format)                             sessions#index
#                     POST   /sessions(.:format)                             sessions#create
#         new_session GET    /sessions/new(.:format)                         sessions#new
#        edit_session GET    /sessions/:id/edit(.:format)                    sessions#edit
#             session GET    /sessions/:id(.:format)                         sessions#show
#                     PATCH  /sessions/:id(.:format)                         sessions#update
#                     PUT    /sessions/:id(.:format)                         sessions#update
#                     DELETE /sessions/:id(.:format)                         sessions#destroy
#              points GET    /points(.:format)                               points#index
#                     POST   /points(.:format)                               points#create
#           new_point GET    /points/new(.:format)                           points#new
#          edit_point GET    /points/:id/edit(.:format)                      points#edit
#               point GET    /points/:id(.:format)                           points#show
#                     PATCH  /points/:id(.:format)                           points#update
#                     PUT    /points/:id(.:format)                           points#update
#                     DELETE /points/:id(.:format)                           points#destroy
