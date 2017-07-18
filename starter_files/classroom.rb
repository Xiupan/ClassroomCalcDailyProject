# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  return grade_hash[student][assignment_num - 1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  scoresArr = []
  grade_hash.map do |key, value|
    scoresArr << value[assignment_num - 1]
  end
  scoresArr
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  scoresArr = []
  grade_hash.map do |key, value|
    scoresArr << value[assignment_num - 1]
  end
  scoresArr.sum / scoresArr.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  averageArr = []
  studentsArr = []
  zippedArr = []

  grade_hash.each do |key, value|
    studentsArr << key
    averageArr << (value.sum / value.length)
  end

  zippedArr = studentsArr.zip(averageArr)
  zippedArr.to_h
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  if score >= 90
    return "A"
  elsif score >= 80
    return "B"
  elsif score >= 70
    return "C"
  elsif score >= 60
    return "D"
  else
    return "F"
  end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  letterGradesAllStudents = []
  allStudents = []
  combinedArr = []

  averageAllStudents =  averages(grade_hash)
  averageAllStudents.each do |key, value|
    allStudents << key
    letterGradesAllStudents << letter_grade(value)
  end
  
  combinedArr = allStudents.zip(letterGradesAllStudents)
  return combinedArr.to_h
end

# Return the average for the entire class.
def class_average(grade_hash)
  newArr = []
  grade_hash.map do |key, value|
    newArr << (value.sum / value.length)
  end
  newArr.sum / newArr.length
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  studentsArr = []
  gradesArr = []
  topStudentsOnly = []

  grade_hash.each do |key, value|
    studentsArr << key
    gradesArr << value.sum / value.length
  end

  combinedArr = studentsArr.zip(gradesArr)
  topStudentsHash = combinedArr.sort_by{|_key, value| value}.reverse.to_h

  topStudentsHash.each do |key, value|
    topStudentsOnly << key
  end

  return topStudentsOnly.take(number_of_students)
end
