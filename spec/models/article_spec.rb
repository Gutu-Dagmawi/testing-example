require 'rails_helper'

RSpec.describe Article do
  # Hooks(before, after and around)
  let(:user) { create(:user) }
  let(:users) { create_list(:user, 10) }

  it 'is valid when created with all attributes' do
    article = build(:article, author: user)
    expect(article).to be_valid
  end

  context 'when its given incomplete or invalid attributes' do
    it 'is invalid when no title is given' do
      article = Article.new(body: "some body", author_id: user.id)
      expect(article).to_not be_valid
      expect(article.errors.full_messages).to include("Title can't be blank")
    end

    it 'is invalid when no body is given' do
      article = Article.new(title: "some title", author_id: user.id)
      expect(article).to_not be_valid
      expect(article.errors.full_messages).to include("Body can't be blank")
    end

    it 'is invalid when title is not unique' do
      article1 = Article.create!(title: "some title", body: "some body", author_id: user.id)
      article2 = Article.new(title: "some title", body: "some body", author_id: user.id)
      expect(article2).to_not be_valid
      expect(article2.errors.full_messages).to include("Title has already been taken")
    end
  end
end
