For Score Partial in index.erb:

 <%= erb :_score, layout: false, locals: {question: @question} %>



FOR INDEX.ERB
<!-- <ol>
  <% @sort.each do |id, question| %>
    <h2>
      <li>
        <a href="/questions/<%= id %>"><%= question[0] %></a><p>Score: <%= question[1] %></p>
      </li>
    </h2>
</ol> -->

FOR INDEX.RB:

#   @questions_hash = {}
#   @questions.each do |question|
#     @questions_hash[question.id] = [question.question, question.score]
#   end
#   @questions_hash

#  @sort = @questions_hash.sort_by {|key, value| value[1]}.reverse.to_h