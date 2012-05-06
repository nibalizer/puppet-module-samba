require 'rspec-puppet'

describe 'samba::dfsroot' do
  #tests go here
  let(:title) {'testing'}

  it { should include_class('samba') }

  it do
    should contain_concat__fragment('testing').with({
      'ensure' => 'present',
      'target' => '/etc/samba/smb.conf',
      'order'  => '20',
    })
  end
end
