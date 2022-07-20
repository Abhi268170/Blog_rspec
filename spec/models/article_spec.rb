require 'rails_helper'


RSpec.describe Article, type: :model do


      it "should have a title" do
        article = Article.new(
        title: '',
        body: 'valid body'
        )
        expect(article).to_not be_valid
        article.title = 'valid title'
        expect(article).to be_valid
      end


      it "should have a body" do
        article = Article.new(
        title: 'valid title',
        body: ''
        )
        expect(article).to_not be_valid
        article.body = 'valid body'
        expect(article).to be_valid
      end


      context " title should have a length constraint" do
        it { should validate_length_of(:title).is_at_least(3).is_at_most(20) }

        it "title  length less than 3 is invalid" do
          article = Article.new(
          title: 'as',
          body: 'valid body'
          )
          expect(article).to_not be_valid
        end
      end


      context " body should have a length constraint" do
        it { should validate_length_of(:body).is_at_least(3).is_at_most(200) }

        it "body  length less than 3 is invalid" do
          article = Article.new(
          title: 'valid title',
          body: 'it'
          )
          expect(article).to_not be_valid
        end
    end
    describe "associations" do
      it { is_expected.to have_many(:comments)}
    end

end