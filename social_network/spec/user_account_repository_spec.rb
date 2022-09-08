require 'user_account_repository'

RSpec.describe UserAccountRepository do
    def reset_user_account_table
        user = 'iniffur'
        password = ENV['PGPASSWORD']
        seed_sql = File.read('spec/seeds_user_accounts.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network', user: user, password: password })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_user_account_table
    end

    it 'Returns all user accounts' do
        repo = UserAccountRepository.new

        user_accounts = repo.all

        expect(user_accounts.length).to eq(2)

        expect(user_accounts[0].id).to eq '1'
        expect(user_accounts[0].email_address).to eq 'fake@fake.com'
        expect(user_accounts[0].username).to eq 'dave_franks'


        expect(user_accounts[1].id).to eq '2'
        expect(user_accounts[1].email_address).to eq 'definitelyfake@fake.com'
        expect(user_accounts[1].username).to eq 'mick_franks'
    end

    it 'Returns first user account' do
        repo = UserAccountRepository.new

        user_account = repo.find(1)

        expect(user_account.email_address).to eq 'fake@fake.com'
        expect(user_account.username).to eq 'dave_franks'
    end

    it 'Creates a new user account' do
        repo = UserAccountRepository.new
        user_account = UserAccount.new

        user_account.email_address = 'maybefake@fake.com'
        user_account.username = 'danny_martin'


        repo.create(user_account)
        user_accounts = repo.all

        last_user_account = user_accounts.last

        expect(last_user_account.email_address).to eq 'maybefake@fake.com'
        expect(last_user_account.username).to eq 'danny_martin'
    end

    it 'Deletes an existing user account' do
        repo = UserAccountRepository.new

        repo.delete(1)
        user_account = repo.all
        expect(user_account.length).to eq(2)

    end
end