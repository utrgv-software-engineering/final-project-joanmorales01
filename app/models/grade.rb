class Grade < ApplicationRecord
    validates_presence_of :student_id
    validates_presence_of :student_name
    validates_presence_of :student_grade
    validate :grade_must_be_greater_than_or_equal_to_zero
    validate :grade_must_be_less_than_or_equal_to_hundred

    #custom validator
    #makes sure grade is larger than zero
    def grade_must_be_greater_than_or_equal_to_zero
        #if it is not null, if it was null then we can't compare it to zero
        if student_grade != nil
            if student_grade < 0
                errors.add(:student_grade, "can't be less than 0")
            end
        end
    end
    def grade_must_be_less_than_or_equal_to_hundred
        if student_grade != nil
            if student_grade > 100
                errors.add(:student_grade, "can't be greater than 100")
            end
        end
    end
end
