require 'spec_helper'

describe 'aem::author' do
  describe service('aem-author') do
    it { should be_running }
    it { should be_enabled }
  end
  describe port(4502) do
    it { should_not be_listening.with('tcp') }
  end

  describe port(8443) do
    it { should be_listening.with('tcp') }
  end

  describe file('/opt/aem/author/keystore.pkcs12') do
    it { should be_file }
  end

  describe file('/opt/aem/author/crx-quickstart/install/org.apache.felix.http.config') do
    it { should be_file }
  end
end