require 'post_repository'

RSpec.describe PostRepository do
    def reset_post_table
        user = 'iniffur'
        password = ENV['PGPASSWORD']
        seed_sql = File.read('spec/seeds_posts.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network', user: user, password: password })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_post_table
    end

    it 'Returns all user accounts' do
        repo = PostRepository.new

        posts = repo.all

        expect(posts.length).to eq(2)

        expect(posts[0].id).to eq '1'
        expect(posts[0].title).to eq 'Monday'
        expect(posts[0].content).to eq 'Today I ate toast'
        expect(posts[0].num_of_views).to eq '14'
        expect(posts[0].user_account_id).to eq '1'



        expect(posts[1].id).to eq '2'
        expect(posts[1].title).to eq 'Tuesday'
        expect(posts[1].content).to eq 'Today I took the bins out'
        expect(posts[1].num_of_views).to eq '6'
        expect(posts[1].user_account_id).to eq '1'

    end

    it 'Returns first post' do
        repo = PostRepository.new

        post = repo.find(1)

        expect(post.title).to eq 'Monday'
        expect(post.content).to eq 'Today I ate toast'
        expect(post.num_of_views).to eq '14'
        expect(post.user_account_id).to eq '1'
    end

    it 'Creates a new post' do
        repo = PostRepository.new
        post = Post.new

        post.title = 'Wednesday'
        post.content = 'Today I washed my car'
        post.num_of_views = '6360'
        post.user_account_id = '1'

        repo.create(post)
        posts = repo.all

        last_post = posts.last

        expect(last_post.title).to eq 'Wednesday'
        expect(last_post.content).to eq 'Today I washed my car'
        expect(last_post.num_of_views).to eq '6360'
        expect(last_post.user_account_id).to eq '1'
    end

    it 'Deletes an existing post' do
        repo = PostRepository.new

        repo.delete(1)
        posts = repo.all
        expect(posts.length).to eq(1)

    end

    it "Updates post with a new number of views" do
        repo = PostRepository.new
        post = repo.find(1)

        post.title = 'Monday'
        post.content = 'Today I ate toast'
        post.num_of_views = '20'
        post.user_account_id = '1'

        repo.update(post)

        updated_post = repo.find(1)
        expect(updated_post.num_of_views).to eq '20'
    end
    
end