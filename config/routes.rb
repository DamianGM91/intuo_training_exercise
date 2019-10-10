Rails.application.routes.draw do
  get '/', to: 'application#json_test'
end
