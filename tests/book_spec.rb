require_relative '../classes/book'

describe 'Create book object' do
  context 'given the valid inputs' do
    it 'should create a book with title = Harry Potter and author = J.K. Rowling' do
      book = Book.new('Harry Potter', 'J.K. Rowling')
      expect(book.title).to eql('Harry Potter')
      expect(book.author).to eql('J.K. Rowling')
    end
  end
end
