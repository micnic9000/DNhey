require 'minitest/autorun'

def read_fasta_to_array file_name
	file = File.new(file_name, "r")

	file.gets # Skip first line

	codons = []
  while (line = file.gets)
    codons.push(line_to_codons line)
  end

  file.close

  return codons.flatten
end

def line_to_codons line
	index = 0
	codons = []
	while((codon = line[index,3]).length == 3)
		codons.push(codon)
		index = index + 3
	end

	codons
end

describe '.line_to_codons' do
	describe 'when given a string containing 3 codons' do
		before do
			@result = line_to_codons("CTGCTGATG")
		end
		it 'returns an array' do
			assert_equal(Array, @result.class)
		end
		it 'returns a array containing 3 elements' do
			assert_equal 3, @result.size
		end
		it 'returns the correct elements' do
			assert_equal ['CTG','CTG','ATG'], @result
		end
	end
	describe 'when given a string containing 2 codons' do
		before do
			@result = line_to_codons("TGCTGA")
		end
		it 'returns an array containing 2 elements' do
			assert_equal 2, @result.size
		end
		it 'returns the correct elements' do
			assert_equal ['TGC','TGA'], @result
		end
	end
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
		it 'returns an array with 5 elements' do
			assert_equal 5, @result.size
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