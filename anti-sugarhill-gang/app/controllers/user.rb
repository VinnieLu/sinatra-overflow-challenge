get "/user/register" do
	erb :register
end

post "/user/register" do
	@user = User.new(params)
	if @user.valid?
		@user.save
		redirect "/user/login"
	else
		@error = "Invalid name or email"
		erb :register
	end
end

get "/user/login" do
	erb :login
end

post "/user/login" do
	@user = User.find_by(email: params[:email])
	if @user.password == params[:password]
		session[:user_id] = @user.id
		redirect "/questions"
	else
		@error = "Incorrect email or password"
		erb :login
	end
end

get "/user/logout" do
	session[:user_id] = nil
	redirect "/questions"
end