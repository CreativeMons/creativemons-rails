RailsAdmin.config do |config|

  # Authorize

  config.authorize_with do
    authenticate_or_request_with_http_basic('Your login/password') do |username, password|
      username == 'login' && password == 'password'
    end
  end

  # PaperTrail

  config.audit_with :paper_trail, 'User',  'PaperTrail::Version'

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
