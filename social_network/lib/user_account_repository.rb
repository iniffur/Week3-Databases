require_relative 'user_account'

class UserAccountRepository
    def all
        query = 'select * from user_accounts;'
        result_set = DatabaseConnection.exec_params(query, [])

        user_accounts = []

      result_set.each do |record|
        user_account = UserAccount.new
        user_account.id = record['id']
        user_account.email_address = record['email_address']
        user_account.username = record['username']

        user_accounts << user_account
      end
      return user_accounts
    end

    def find(id)
      query = 'select * from user_accounts where id = $1;'
      params = [id]
      result_set = DatabaseConnection.exec_params(query, params)

      record = result_set[0]

      user_account = UserAccount.new
      user_account.id = record['id']
      user_account.email_address = record['email_address']
      user_account.username = record['username']

      return user_account

    end

    def create(user_account)
      query = 'insert into user_accounts (email_address, username) values ($1, $2);'
      params = [user_account.email_address, user_account.username]

      DatabaseConnection.exec_params(query, params)
    end

    def delete(id)
      query = 'delete from posts where id = $1;'
      params = [id]
      result_set = DatabaseConnection.exec_params(query, params)
    end

end