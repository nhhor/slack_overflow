FactoryBot.define do



  factory(:user) do
    email {'person@mail.com'}
    password {'password123'}
    password_confirmation {'password123'}

    factory(:question) do
      # BAD CODE
      @users = User.all.first
      @users.clear
      # BAD CODE

      user_id = FactoryBot.create(:user)
      title {'title_stuff'}
      question {'question_stuff'}
      user_id {user_id.id}
    end

  end
end
