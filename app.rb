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
    puts "[1] List all Books"
    puts "[2] List all people"
    puts "[3] Create a person"
    puts "[4] Create a book"
    puts "[5] Create a rental"
    puts "[6] list all rentals"
    puts "[7] Exit"
    puts
    print "choose number of operation you want to proceed: "
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
    when '7'
      exit
    else
      puts
      p 'You entered wrong number please try again'
      puts
      run_program
    end
  end

  def list_books
    puts
    if @books_list.length == 0
      p "There is no books to show, Add new one"
      puts
      run_program
    else
      @books_list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
      puts
      run_program
    end
  end

  def list_people
    puts
    if @people_list.length == 0
      p "There is no people to show, Add new one"
      puts
      run_program
    else
      @people_list.each do |person|
        p "Person ID: #{person.id}, Name: #{person.name} (#{person.class.name}), Age: #{person.age}"
      end
      puts
      run_program
    end
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
    puts
    p 'Student added successfully'
    puts
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
    puts
    p 'Teacher added successfully'
    puts
    run_program
  end

  def create_book
    print 'Book title: '
    title = gets.chomp
    print 'Book author: '
    author = gets.chomp
    @books_list.push(Book.new(title, author))
    puts
    p 'Book added successfully'
    puts
    run_program
  end

  def create_rental
    if @books_list.length == 0
      puts
      p "Please add a book first"
      puts
      run_program
    elsif @people_list.length == 0
      puts
      p "Please add a person first"
      puts
      run_program
    else
      p 'Please select a book: '
      puts
      @books_list.each_with_index do |book, id|
        puts "[#{id}] #{book.title}. By: #{book.author}"
      end
      puts
      print "Choose book number: "
      book = @books_list[gets.chomp.to_i]
      p 'Please select the person'
      puts
      @people_list.each_with_index do |person, id|
        puts "[#{id}] Name: #{person.name} (#{person.class.name})"
      end
      puts
      print "Choose person number: "
      person = @people_list[gets.chomp.to_i]
      print 'Date of rental (dd-mm-yyyy): '
      date = gets.chomp
      @rentals_list.push(Rental.new(date, book, person))
      puts
      p 'Rental data added successfully'
      puts
      run_program
    end
  end

  def list_rentals
    puts
    if @rentals_list.length == 0
      p "There is no rentals to show, Add new one"
      puts
      run_program
    else
      p "Enter person's id: "
      id = gets.chomp.to_i
      @people.each do |person|
        if person.id == id
          person.rentals.each do |rental|
            p "Book title: #{rental.book.title}, Rental date: #{rental.date}"
          end
        else
          p 'There are no rentals data for that id'
        end
      end
    end
  end

  def exit
    puts
    p "Have a great day, Bye..."
  end
end