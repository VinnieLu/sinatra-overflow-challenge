
get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :question
end

post "/questions/question_comment/:question_id" do
	@comment_object = QuestionComment.find_or_create_by(comment: params[:comment], user_id: session[:user_id], question_id: params[:question_id])
	erb :_question_comment, layout: false, locals: { question_comment_obj: @comment_object }
end

post "/questions/answer_comment/:question_id" do
	@answer = Answer.find_by(question_id: params[:question_id])
	@comment = AnswerComment.find_or_create_by(comment: params[:comment], user_id: session[:user_id], answer_id: @answer.id)
	erb :_answer_comment, layout: false, locals: { answer: @comment }
end

post "/questions/answer_add/:question_id" do
	@answer = Answer.find_or_create_by(answer: params[:answer], user_id: session[:user_id], question_id: params[:question_id])
	# redirect "/questions/#{params[:question_id]}"
	erb :_answer, layout: false, locals: { answer_obj: @answer }
end