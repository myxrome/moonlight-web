Rails.application.routes.draw do

  root to: 'application#index'
  get '/:key/play', to: 'application#play'

  get 'scenarios', to: 'scenarios#index'
  get 'scenarios/:key/play', to: 'scenarios#play'

end
