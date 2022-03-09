require '../classes/teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'The initialize method should return create new Teacher object' do
      teacher = Teacher.new('Math', 20, 'Kerolous')
      expect(teacher.name).to eq 'Kerolous'
    end

    it 'The can_use_services? method should return true' do
      teacher = Teacher.new('Math', 20, 'Kerolous')
      expect(teacher.can_use_services?).to be true
    end
  end
end
