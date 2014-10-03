require 'spec_helper'

describe 'samba::global', :type => :define do

  let :facts do
    {
    :concat_basedir => '/dne',
    :osfamily       => 'Debian',
    }
  end

  let :title do
    'global_config'
  end

  let :params do
    { :dns_proxy => '8.8.8.8' }
  end

  it { should contain_concat__fragment('global_config').with({
    'content' => /dns proxy \s* = 8.8.8.8/,
    'order'   => "1"
    })
  }
end

