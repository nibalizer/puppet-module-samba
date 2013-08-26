require 'spec_helper'

describe 'samba::dfsroot', :type => :define do

  let :facts do
    {
    :concat_basedir => '/dne',
    :osfamily       => 'Debian',
    }
  end

  let :title do
    'testing'
  end

  it { should include_class('samba') }

  it { should contain_concat__fragment('testing').with(
      'ensure' => 'present',
      'target' => '/etc/samba/smb.conf',
      'order'  => '20'
  )}
end
