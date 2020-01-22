require 'rails_helper'

describe Question do
  it { should have_many(:answers) }
end

# describe Question do
#   it 'creates a new question' do
#     # @user = FactoryBot.create(:user)
# # binding.pry
#     question = FactoryBot.create(:question)
#     question.title.should eq 'title_stuff'
#     question.question.should eq 'question_stuff'
#     question.user_id.should eq 0
#   end
#
# end



# describe Question do
#   it("titleizes the name of a product") do
#     product = Question.create({name: "taco salad", cost: 1.99, country_of_origin: "USA"})
#     expect(product.name()).to(eq("Taco Salad"))
#   end
# end
#
# describe Question do
#   it 'converts the name to lowercase' do
#     task = FactoryBot.create(:task, :name => "Herd the cats")
#     task.name.should eq "Herd the cats"
#   end
# end
