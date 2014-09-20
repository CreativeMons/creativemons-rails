class CommentsController < ApplicationController
  def create
    @comment = Comment.new(strong_params)

    #$user_token = $this->getUserToken();
    #$user       = User::where('token', '=', $userToken)->first();
#
    #if($validator->fails()) {
    #  return Redirect::back()->withErrors($validator)
    #                         ->withInput();
    #}
    #else {
    #  if($user->comments()->save($comment)) {
    #    $comment->notifyEntryAuthor();
    #    return Redirect::route('entries.showAsVoter', [ $comment->entry->id ]);
    #  } else {
    #    return "Impossible d'ajouter le commentaire.";
    #  }
    #}
  end

  def strong_params
    params.require(:comment).permit(
      :entry_id,
      :content
    )
  end
end
