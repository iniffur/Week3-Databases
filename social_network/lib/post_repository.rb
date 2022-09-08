require_relative 'post'

class PostRepository
    def all
        query = 'select * from posts;'
        result_set = DatabaseConnection.exec_params(query, [])

        posts = []

      result_set.each do |record|
        post = Post.new
        post.id = record['id']
        post.title = record['title']
        post.content = record['content']
        post.num_of_views = record['num_of_views']
        post.user_account_id = record['user_account_id']

        posts << post
      end
      return posts
    end

    def find(id)
      query = 'select * from posts where id = $1;'
      params = [id]
      result_set = DatabaseConnection.exec_params(query, params)

      record = result_set[0]

      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.num_of_views = record['num_of_views']
      post.user_account_id = record['user_account_id']

      return post

    end

    def create(post)
      query = 'insert into posts (title, content, num_of_views, user_account_id) values ($1, $2, $3, $4);'
      params = [post.title, post.content, post.num_of_views, post.user_account_id]

      DatabaseConnection.exec_params(query, params)
    end

    def delete(id)
      query = 'delete from posts where id = $1;'
      params = [id]
      result_set = DatabaseConnection.exec_params(query, params)
    end

    def update(post)
      query = 'update posts set num_of_views = $1 where id = $2'
      params = [post.num_of_views, post.id]

      DatabaseConnection.exec_params(query, params)

    end

end