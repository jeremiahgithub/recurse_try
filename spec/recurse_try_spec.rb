require 'recurse_try'
describe RecurseTry do
  before(:all) do
    String.send(:include, RecurseTry)
  end
  describe '.version' do
    it 'returns a version' do
      expect(described_class.version).not_to be_nil
    end
  end
  describe '.recurse_try' do
    let(:obj) {'1234'}
    context 'with one method as string' do
      let(:try) { 'to_i' }
      it 'returns result' do
        expect(obj.recurse_try(try)).to eq(1234)
      end
    end
    context 'with two methods as string' do
      let(:try) { 'to_i' }
      it 'returns result' do
        expect(obj.recurse_try(try)).to eq(1234)
      end
    end
    context 'with non-existant method returns nil' do
      let(:try) { 'to_i.i_do_not_exist' }
      it 'returns result' do
        expect(obj.recurse_try(try)).to eq(nil)
      end
    end

    context 'with more that variable as array' do
      let(:try) { ['to_i', 'to_s'] }
      it 'returns result' do
        expect(obj.recurse_try(try)).to eq('1234')
      end
    end

    context 'with hash' do
      let(:try) { {split: ''} }
      it 'returns result' do
        expect(obj.recurse_try(try)).to eq(['1','2','3','4'])
      end
    end

    context 'with each enumerator' do
      let(:try) { [{split: ''}, 'each', 'to_i'] }
      it 'returns result' do
        expect(obj.recurse_try(try)).to eq(['1','2','3','4'])
      end
    end

    context 'with map enumerator' do
      let(:try) { [{split: ''}, 'map', 'to_i'] }
      it 'returns result' do
        expect(obj.recurse_try(try)).to eq([1,2,3,4])
      end
    end

    context 'with complex hash' do
      let(:try) { [{split: ''},'map','to_i',{'+': 1}] }
      it 'returns result' do
        expect(obj.recurse_try(try)).to eq([2, 3, 4, 5])
      end
    end
  end
end
