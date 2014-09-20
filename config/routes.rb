Rails.application.routes.draw do

  resource :comments
  resource :entries

  get '/welcome' => 'pages#welcome'
  get '/thanks'  => 'pages#thanks'

  root 'entries#index'

  # Route::get('/entries.json',           [ 'as' => 'entries.indexJson',    'uses' => 'EntryController@indexJson'    ]);
  # Route::get('/author/entries/{token}', [ 'as' => 'entries.showAsAuthor', 'uses' => 'EntryController@showAsAuthor' ]);

  # Route::get('/voter/entries/{id}',           [ 'as' => 'entries.showAsVoter',  'uses' => 'EntryController@showAsVoter'  ]);
  # Route::get('/voter/entries/{id}/vote_up',   [ 'as' => 'entries.voteUp',       'uses' => 'EntryController@voteUp'       ]);
  # Route::get('/voter/entries/{id}/vote_down', [ 'as' => 'entries.voteDown',     'uses' => 'EntryController@voteDown'     ]);

end
