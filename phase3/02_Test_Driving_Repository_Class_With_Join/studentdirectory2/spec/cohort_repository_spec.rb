require 'cohort_repository'

describe CohortRepository do

    it "finds cohort 1 with all related students" do
        repo = CohortRepository.new
        cohort = repo.find_with_students(1)

        expect(cohort.cohort_name).to eq "Pineapple"
        expect(cohort.students.length).to eq(2)
    end
end