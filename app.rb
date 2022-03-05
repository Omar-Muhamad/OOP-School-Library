require_relative 'person'
require_relative 'book'
require_relative 'classroom'
require_relative 'corrector'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @people_list = []
    @books_list = []
    @rentals_list = []
  end

  def run_program
    puts '[1] List all Books'
    puts '[2] List all people'
    puts '[3] Create a person'
    puts '[4] Create a book'
    puts '[5] Create a rental'
    puts '[6] list all rentals'
    puts '[7] Exit'
    puts
    print 'choose number of operation you want to proceed: '
    user_choice = gets.chomp
    operator(user_choice)
  end

  def operator(user_choice)
    case user_choice
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      exit
    end
  end

  def list_books
    if @books_list.length.zero?
      p 'There is no books to show, Add new one'
    else
      @books_list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    run_program
  end

  def list_people
    if @people_list.length.zero?
      p 'There is no people to show, Add new one'
    else
      @people_list.each do |person|
        p "Person ID: #{person.id}, Name: #{person.name} (#{person.class.name}), Age: #{person.age}"
      end
    end
    run_program
  end

  def create_person
    p 'What do you want to create?'
    puts '[1] Student'
    puts '[2] Teacher'
    print 'Enter number: '
    choice = gets.chomp
    case choice
    when '1' then add_student
    when '2' then add_teacher
    else p 'Please enter a valid input, it must be the number 1 or the number 2'
    end
  end

  def add_student
    print 'Student classroom: '
    classroom = gets.chomp.to_i
    print 'Student name: '
    name = gets.chomp
    print 'Student age: '
    age = gets.chomp.to_i
    print 'Has Parent permission? [Y/N]: '
    input = gets.chomp.downcase
    valid_permission = input == 'y'
    @people_list.push(Student.new(classroom, age, name, parent_permission: valid_permission))
    p 'Student added successfully'
    run_program
  end

  def add_teacher
    print 'Teacher age: '
    age = gets.chomp.to_i
    print 'Teacher name: '
    name = gets.chomp
    print 'Teacher specialization: '
    specialization = gets.chomp
    @people_list.push(Teacher.new(specialization, age, name))
    p 'Teacher added successfully'
    run_program
  end

  def create_book
    print 'Book title: '
    title = gets.chomp
    print 'Book author: '
    author = gets.chomp
    @books_list.push(Book.new(title, author))
    p 'Book added successfully'
    run_program
  end

  def create_rental
    p 'Please select a book: '
    @books_list.each_with_index do |book, id|
      puts "[#{id}] #{book.title}. By: #{book.author}"
    end
    print 'Choose book number: '
    book = @books_list[gets.chomp.to_i]
    p 'Please select the person'
    @people_list.each_with_index do |person, id|
      puts "[#{id}] Name: #{person.name} (#{person.class.name})"
    end
    print 'Choose person number: '
    person = @people_list[gets.chomp.to_i]
    print 'Date of rental (dd-mm-yyyy): '
    date = gets.chomp
    @rentals_list.push(Rental.new(date, book, person))
    p 'Rental data added successfully'
    run_program
  end

  def list_rentals
    puts
    if @rentals_list.length.zero?
      p 'There is no rentals to show, Add new one'
      puts
      run_program
    else
      print "Enter person's id: "
      id = gets.chomp.to_i
      @people_list.each do |person|
        if person.id == id
          person.rentals.each do |rental|
            p "Book title: #{rental.book.title}, Rental date: #{rental.date}"
          end
          run_program
        else
          puts
          p 'There are no rentals data for that id'
        end
      end
    end
  end

  def exit
    puts
    p 'Have a great day, Bye...'
  end
end
