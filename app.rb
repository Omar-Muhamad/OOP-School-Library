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
    print 'Choose number of operation you want to proceed: '
    user_choice = gets.chomp
    operator(user_choice)
  end

  def operator(user_choice)
    case user_choice
    when '1' then list_books
    when '2' then list_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_rentals
    else exit
    end
  end

  def list_books
    if @books_list.length.zero?
      puts '>>>>>>>>>>>>>>>>>  There is no books to show, Add new one  <<<<<<<<<<<<<<<<<'
    else
      @books_list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    run_program
  end

  def list_people
    if @people_list.length.zero?
      puts '>>>>>>>>>>>>>>>>>  There is no people to show, Add new one  <<<<<<<<<<<<<<<<<'
    else
      @people_list.each { |person| puts "Person ID: #{person.id}, Name: #{person.name} (#{person.class.name}), Age: #{person.age}" }
    end
    run_program
  end

  def create_person
    puts '>>>>>>>>>>>>>>>>>  What do you want to create?  <<<<<<<<<<<<<<<<<'
    puts '[1] Student'
    puts '[2] Teacher'
    print 'Enter number: '
    choice = gets.chomp
    case choice
    when '1' then add_student
    when '2' then add_teacher
    else
      puts '>>>>>>>>>>>>>>>>>  Please enter a valid input, 1 or 2  <<<<<<<<<<<<<<<<<'
    end
    run_program
  end

  def add_student
    print 'Enter Student classroom: '
    classroom = gets.chomp.to_i
    print 'Enter Student name: '
    name = gets.chomp
    print 'Enter Student age: '
    age = gets.chomp.to_i
    print 'Has Parent permission? [Y/N]: '
    input = gets.chomp.downcase
    valid_permission = input == 'y'
    @people_list.push(Student.new(classroom, age, name, parent_permission: valid_permission))
    puts '>>>>>>>>>>>>>>>>>  Student added successfully  <<<<<<<<<<<<<<<<<'
  end

  def add_teacher
    print 'Teacher age: '
    age = gets.chomp.to_i
    print 'Teacher name: '
    name = gets.chomp
    print 'Teacher specialization: '
    specialization = gets.chomp
    @people_list.push(Teacher.new(specialization, age, name))
    puts '>>>>>>>>>>>>>>>>>  Teacher added successfully  <<<<<<<<<<<<<<<<<'
  end

  def create_book
    print 'Book title: '
    title = gets.chomp
    print 'Book author: '
    author = gets.chomp
    @books_list.push(Book.new(title, author))
    puts '>>>>>>>>>>>>>>>>>  Book added successfully  <<<<<<<<<<<<<<<<<'
    run_program
  end

  def create_rental
    if @books_list.length.zero?
      puts '>>>>>>>>>>>>>>>>>  No books found, add one first  <<<<<<<<<<<<<<<<<'
    elsif @people_list.length.zero?
      puts '>>>>>>>>>>>>>>>>>  No people found, add one first  <<<<<<<<<<<<<<<<<'
    else
      puts '>>>>>>>>>>>>>>>>>  Please select a book  <<<<<<<<<<<<<<<<<'
      @books_list.each_with_index { |book, id| puts "[#{id}] #{book.title}. By: #{book.author}" }
      print 'Choose book number: '
      book = @books_list[gets.chomp.to_i]
      puts '>>>>>>>>>>>>>>>>>  Please select the person  <<<<<<<<<<<<<<<<<'
      @people_list.each_with_index { |person, id| puts "[#{id}] Name: #{person.name} (#{person.class.name})" }
      print 'Choose person number: '
      person = @people_list[gets.chomp.to_i]
      print 'Date of rental (dd-mm-yyyy): '
      date = gets.chomp
      @rentals_list.push(Rental.new(date, book, person))
      puts '>>>>>>>>>>>>>>>>>  Rental data added successfully  <<<<<<<<<<<<<<<<<'
    end
    run_program
  end

  def list_rentals
    if @rentals_list.length.zero?
      puts '>>>>>>>>>>>>>>>>>  There is no rentals to show, Add new one  <<<<<<<<<<<<<<<<<'
    else
      print "Enter person's id: "
      id = gets.chomp.to_i
      @people_list.each do |person|
        if person.id == id
          person.rentals.each { |rental| puts "Book title: #{rental.book.title}, Rental date: #{rental.date}" }
          break
        else
          puts '>>>>>>>>>>>>>>>>>  There are no rentals data for that id  <<<<<<<<<<<<<<<<<'
        end
      end
    end
    run_program
  end

  def exit
    puts '>>>>>>>>>>>>>>>>>  Have a great day, Bye...  <<<<<<<<<<<<<<<<<'
  end
end
