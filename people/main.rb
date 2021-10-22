require_relative 'student'
require_relative 'teacher'

class PersonInitialize
  def initialize
    @people = []
  end

  def list_people
    puts 'No student or teacher added' if @people.empty?

    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
  end

  attr_reader :people

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    end
    puts 'Person created successfully'
    puts ''
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [y/n]: '
    parent_permission = gets.chomp == 'y'
    save_person(age, name, parent_permission, true)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp
    save_person(age, name, specialization, false)
  end

  def save_person(age, name, parent_permission, student)
    if student
      student = Student.new(age, name, parent_permission)
      @people << student
    else
      teacher = Teacher.new(age, specialization, name)
      @people << teacher
    end
  end
end
