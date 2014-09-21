class EntriesController < ApplicationController
  def index
    @entries = Entry.published
  end

  def show
    if params[:voter_token]
      @voter = User.find_by_token(params[:voter_token])
      @entry = Entry.find(params[:id])
    elsif params[:author_token]
      @author = true
      @entry  = Entry.find_by_token(params[:token])
    else
      @entry = Entry.find(params[:id])
    end
  end

  def new
    @entry = Entry.new
  end

  def create
  end

  def vote_up
  end

  def vote_down
  end

  def strong_params
    params.require(:comment).permit(
      :entry_id,
      :content
    )
  end
end





#public function index() {
#  $entries = Entry::all()->filter(function($entry){
#    return $entry->isPublished();
#  });
#
#  return View::make('entries.index')->with('entries', $entries);
#}
#
#public function indexJson() {
#  $entries = Entry::all();
#
#  $response = $entries->map(function($entry){
#    return $entry->asJson();
#  });
#
#  return Response::json($response);
#}
#
#
#



#public function store() {
#  $input = Input::all();
#
#  if($input['kind'] == 'event') {
#    $input['start_date'] = Input::get('start_date');
#    $input['end_date']   = Input::get('end_date');
#  }
#
#  $rules = array(
#    'title'        => 'required',
#    'content'      => 'required',
#    'author_name'  => 'required',
#    'picture'      => 'required',
#    'author_email' => 'required|email',
#    'content'      => 'required',
#    'kind'         => 'required|in:article,event'
#  );
#
#  if($input['kind'] == 'event') {
#    $rules['start_date'] = 'required|date';
#    $rules['end_date']   = 'required|date';
#  }
#
#  $validator = Validator::make($input, $rules);
#  $entry     = new Entry($input);
#
#  if($validator->fails()) {
#    //return View::make('entries.create')->with('entry', $entry)
#    return Redirect::back()->with('entry', $entry)
#                           ->withErrors($validator)
#                           ->withInput($input);
#  }
#  else {
#    if($entry->save()) {
#      $entry->notifyAuthor();
#      $entry->notifyUsers();
#      return Redirect::route('thanks');
#    } else {
#      return "Impossible de créer l'article/évènement.";
#    }
#  }
#}
#
#public function voteUp($id) {
#  $userToken = $this->getUserToken();
#  $voter = User::where('token', '=', $userToken)->first();
#  $entry = Entry::find($id);
#
#  if($voter && $entry){
#    $vote = $entry->voteUp($voter);
#    $vote->notifyAuthor();
#
#    return Redirect::route('entries.showAsVoter', [$id]);
#  } else {
#    App::abort(404);
#  }
#}
#
#public function voteDown($id) {
#  $userToken = $this->getUserToken();
#  $voter = User::where('token', '=', $userToken)->first();
#  $entry = Entry::find($id);
#
#  if($voter && $entry){
#    $vote = $entry->voteDown($voter);
#    $vote->notifyAuthor();
#
#    return Redirect::route('entries.showAsVoter', [$id]);
#  } else {
#    App::abort(404);
#  }
#}
#
