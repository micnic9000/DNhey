require 'minitest/autorun'

def read_fasta_to_array
  []
end

describe '.read_fasta_to_array' do
	it 'returns an array' do
		result = read_fasta_to_array()
		assert_equal Array, result.class
	end
end