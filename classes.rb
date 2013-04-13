class Person
	attr_accessor :first_name, :last_name
	def initialize first_name, last_name
		hat = 'boat'
		@first_name = first_name
		@last_name = last_name
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	def set_first_and_last_name first_name, last_name
		@first_name = first_name
		@last_name = last_name
	end

	def formal_name
		"#{last_name}, #{first_name}"
	end
end

class Spy < Person
	def bond_name
		"#{last_name}, #{full_name}"
	end
end


mike = Person.new('Mike', 'Nicoll')
puts mike.full_name
mike.set_first_and_last_name('Micheal', 'Das Nicoll')
puts mike.formal_name

james = Spy.new('James', 'Cox')
puts james.full_name
puts james.bond_name

mike.bond_name