require 'minitest/autorun'

def read_fasta_to_array file_name
	file = File.new(file_name, "r")
  [0,0]
end


describe '.read_fasta_to_array' do
	describe 'given the filename of a file with 2 codons' do
		before do
			@result = read_fasta_to_array('test_assets/2codons.fasta')
		end
		it 'returns an array' do
			assert_equal Array, @result.class
		end
		it 'returns an array with 2 elements' do
			assert_equal 2, @result.size
		end
	end

	describe 'given an invalid filename' do
    it 'throws an error' do
      assert_raises(Errno::ENOENT) do
      	read_fasta_to_array('fdhjkafdshjksadfkjhadsf')
      end
    end
	end
end