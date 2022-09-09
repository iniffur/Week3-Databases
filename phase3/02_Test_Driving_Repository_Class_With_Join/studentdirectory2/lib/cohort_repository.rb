require_relative 'cohort'
require_relative 'student'


class CohortRepository
    def find_with_students(id)
        query = 'SELECT cohorts.id,
                cohorts.cohort_name,
                cohorts.starting_date,
                students.id AS student_id,
                students.name
                FROM cohorts
                JOIN students ON students.cohort_id = cohorts.id
                WHERE cohorts.id = $1;'

        params = [id]

        result = DatabaseConnection.exec_params(query, params)

        cohort = Cohort.new

        cohort.id = result.first['id']
        cohort.cohort_name = result.first['cohort_name']
        cohort.starting_date = result.first['starting_date']

        result.each do |record|
            student = Student.new
            student.id = record['student_id']
            student.name = record['name']

            cohort.students << student
        end

        return cohort
    end
end