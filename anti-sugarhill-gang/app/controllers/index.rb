get "/" do
	redirect "/questions"
end

get "/questions" do
	@questions = Question.all


  i = 0
	@final = []
	while i < @questions.length
   		if @final.length == 0
     		@final << @questions[i]
   		end
  		x = 0
  		while x < @final.length
  			if !(@final.include?(@questions[i])) && (@questions[i].score > @final[x].score)
    			@final.insert(x, @questions[i])
   			end
   		x += 1
 		  end
 		if !(@final.include?(@questions[i]))
 			@final << @questions[i]
 		end
   	i += 1
   	@final
	end

	erb :index
end

get "/vote/upvote/:id" do
    if session[:user_id]

      @question_vote = QuestionVote.find_or_create_by(user_id: session[:user_id], question_id: params[:id])
      if @question_vote.up == nil && @question_vote.down == nil
        @question_vote.update(up: 1, down: nil)
      elsif @question_vote.up == nil && @question_vote.down == -1
        @question_vote.update(up: nil, down: nil)
      end

      if request.xhr?
        @score = Question.find(params[:id].to_i).score.to_s
      else
        redirect "/questions"
      end

    else
      if request.xhr?
        @score = Question.find(params[:id].to_i).score.to_s
      else
        redirect "/questions"
      end
    end
end

get "/vote/downvote/:id" do

  if session[:user_id]

      @question_vote = QuestionVote.find_or_create_by(user_id: session[:user_id], question_id: params[:id])
    if @question_vote.up == nil && @question_vote.down == nil
      @question_vote.update(up: nil, down: -1)
    elsif (@question_vote.up == 1 && @question_vote.down == nil)
      @question_vote.update(up: nil, down: nil)
    end


    if request.xhr?
      @score = Question.find(params[:id].to_i).score.to_s
    else
      redirect "/questions"
    end

  else
    if request.xhr?
        @score = Question.find(params[:id].to_i).score.to_s
    else
        redirect "/questions"
    end
  end

end
