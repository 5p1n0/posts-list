require 'rails_helper'

RSpec.describe 'Post' do

  describe 'GET /api/posts' do
    it 'list posts' do
      post = Post.create!(title: 'Foo', tags: [Tag.new(name: 'bar')])

      get api_posts_path(format: 'json')
      expect(response).to be_successful

      json = JSON.parse(response.body)
      expect(json).to be_a(Array)
      expect(json[0]['title']).to eq(post.title)
      expect(json[0]['tags'].count).to eq(post.tags.count)
      expect(json[0]['tags'].first['name']).to eq(post.tags.first.name)
    end

    it 'list filtered posts by tigle or tag' do
      matching_post_by_title = Post.create!(title: 'gatto', tags: [Tag.new(name: 'foobar'), Tag.new(name: 'foo'), Tag.new(name: 'bar')])
      matching_post_by_tag = Post.create!(title: 'Foobar', tags: [Tag.new(name: 'gatto'), Tag.new(name: 'bar'), Tag.new(name: 'bar')])
      non_matching_post = Post.create!(title: 'Foo', tags: [Tag.new(name: 'bar')])

      get api_posts_path, params: { term: 'gatto' }, as: :json
      expect(response).to be_successful

      json = JSON.parse(response.body)
      expect(json).to be_a(Array)
      expect(json.count).to eq(2)

      expect(json[0]['title']).to eq(matching_post_by_title.title)
      expect(json[0]['tags'].count).to eq(matching_post_by_title.tags.count)
      expect(json[0]['tags'].first['name']).to eq(matching_post_by_title.tags.first.name)

      expect(json[1]['title']).to eq(matching_post_by_tag.title)
      expect(json[1]['tags'].count).to eq(1)
      expect(json[1]['tags'].first['name']).to eq(matching_post_by_tag.tags.first.name)
    end

    it 'list filtered posts - no results' do
      matching_post = Post.create!(title: 'Foobar', tags: [Tag.new(name: 'foobar')])
      non_matching_post = Post.create!(title: 'Foo', tags: [Tag.new(name: 'bar')])

      get api_posts_path, params: { term: 'gatto' }, as: :json
      expect(response).to be_successful

      json = JSON.parse(response.body)
      expect(json).to be_a(Array)
      expect(json.count).to eq(0)
    end
  end
end
