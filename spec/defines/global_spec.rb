require 'spec_helper'
describe 'samba::global', :type => :define do

  let (:title) { 'global_confg' }

  define "should succeed with a Class['apt']" do
    let (:dns_proxy) { '8.8.8.8' }

    it { should contain_concat__fragment("global").with({
      'content' => /dns proxy \s* = 8.8.8.8/,
      'order'   => "1"
      })
    }
  end
end

