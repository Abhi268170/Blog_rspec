RSpec.describe CommentsController, :type => :controller do
  before :each do
    @article = FactoryBot.build(:article)
  end
  describe '#Create comment' do
      it 'creates a comment' do
        comment = create(:comment)
        @article.comments << comment
        expect{post :create, params: {comment: {id: comment.id, body: "dsfsdgsdg"}, article_id: @article.id}}.
        to change{@article.comments.count}.by(1)
        expect(response).to redirect_to(article_path(@article))
      end
    end


  describe '#DELETE destroy' do
      it 'deletes a comment' do
        comment = create(:comment)
        @article.comments << comment
        expect{delete :destroy, params: {id: comment.id,body: "dsfsdgsdg", article_id: @article.id}}.
        to change{@article.comments.count}.by(-1)        
        expect(response).to redirect_to(article_path(@article))
      end
    end

 
end