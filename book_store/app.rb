require_relative 'lib/database_connection'

DatabaseConnection.connect('book_store')

sql = 'select * from books;'
result = DatabaseConnection.exec_params(sql, [])

result.each do |record|
    id = record['id']
    title = record['title']
    author_name = record['author_name']
    p "#{id} - #{title} - #{author_name}"
end