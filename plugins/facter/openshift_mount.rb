require 'fileutils'

Facter.add( "gear_root_device" ) do
  setcode do
    FileUtils.mkdir_p "/var/lib/openshift"
    %x[/bin/df -P /var/lib/openshift | tail -1].split[0]
  end
end

Facter.add( "gear_root_mount" ) do 
  setcode do
    FileUtils.mkdir_p "/var/lib/openshift"
    %x[/bin/df -P /var/lib/openshift | tail -1 | tr -s ' '].split[5]
  end
end
