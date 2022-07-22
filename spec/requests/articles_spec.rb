require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /index" do
    let(:valid_attributes) do{
      'title' => 'valid',
      'body' => 'valid body'
    }
    end
    let(:invalid_attributes) do{
      'title' => '',
      'body' => ''
     }
    end
    describe "GET /index" do
  
      it "renders a successful response" do
        article = Article.new(valid_attributes)
        article.save
        get articles_url
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_article_url
        expect(response).to be_successful
      end
    end
    describe "POST /create" do
      context "with valid params" do
         before { post '/articles', params: { article: valid_attributes }}
         it "redirects to the created article" do
          expect(response).to redirect_to(article_path(assigns[:article]))
        end
      end
  
      context "with invalid parameters" do
        it "does not create a new article" do
          expect {
            post articles_url, params: { article: invalid_attributes }
          }
        end
  
        it "renders a successful response (i.e. to display the 'new' template)" do
          post articles_url, params: { article: invalid_attributes }
          expect(response).not_to be_successful
        end
      end
    end
    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) do{
          'title'=> 'article',
          'body'=> 'article body'
             }
        end
        it "updates the requested article" do
         article = Article.create! valid_attributes
          patch article_url(article), params: {article: new_attributes }
         article.reload  
        end
    
        it "redirects to the article" do
         article = Article.create! valid_attributes
          patch article_url(article), params: {article: new_attributes }
         article.reload
          expect(response).to redirect_to(article_url(article))
        end
      end
    
      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
         article = Article.create! valid_attributes
          patch article_url(article), params: {article: invalid_attributes }
          expect(response).to_not render_template(:show)
        end
      end
    end
    describe "DELETE /destroy" do
      it "destroys the requested article" do
        article = Article.create! valid_attributes
        expect {
          delete article_url(article) 
        }.to change(Article, :count).by(-1)
      end
    
      it "redirects to the articles list" do
        article = Article.create! valid_attributes
        delete article_url(article)
        expect(response).to redirect_to(articles_url)
      end
    end

    
  end
end






