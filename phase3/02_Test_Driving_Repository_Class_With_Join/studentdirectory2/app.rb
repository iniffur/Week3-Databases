require_relative './lib/database_connection'
require_relative './lib/cohort_repository'
require_relative './lib/cohort'

class Application

        def initialize(student_directory_2, io, cohort_repository)
            DatabaseConnection.connect(student_directory_2)
            @io = io
            @cohort_repository = cohort_repository
        end


        def run
            query1 = 'SELECT * from cohorts where id = 1;'
            result1 = DatabaseConnection.exec_params(query1, [])
            result1.each do |record|
                puts ("Cohort Name: #{record['cohort_name']}, Starting Date: #{record['starting_date']} ")
            end
            query2 = 'select * from students where cohort_id = 1;'
            result2 = DatabaseConnection.exec_params(query2, [])
            result2.each do |record|
                puts ("Pineapple students are: #{record['name']}")
            end
        end

end

if __FILE__ == $0
    app = Application.new(
      'student_directory_2',
      Kernel,
      CohortRepository.new
)
app.run
end