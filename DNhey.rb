require 'minitest/autorun'

def read_fasta_to_array file_name
	file = File.new(file_name, "r")

	file.gets # Skip first line

	codons = []
  while (line = file.gets)
    codons.push(line[0,3])
  end

  file.close

  return codons
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
		it 'strips the first line' do
			refute_equal '>gi', @result[0]
		end
		it 'returns the correct first element (TGC)' do
			assert_equal 'TGC', @result[0]
		end
	end

	describe 'given the filename of a file with 5 codons' do
		before do
			@result = read_fasta_to_array('test_assets/5codons.fasta')
		end
		it 'returns the correct first element (CTG)' do
			assert_equal 'CTG', @result[0]
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