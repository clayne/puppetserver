test_name "Testing Master/Agent backwards compatibility"

step "Check that legacy agents have Puppet 4.x installed" do
  on(hosts, puppet("--version")) do |result|
    assert_match(/\A4\./, result.stdout, "puppet --version does not start with major version 4.")
  end
end

step "Check that the master has Puppetserver 2.x installed" do
  on(master, "puppetserver --version") do |result|
    assert_match(/\Apuppetserver version: 2\./i, result.stdout, "puppetserver --version does not start with major version 2.")
  end
end
