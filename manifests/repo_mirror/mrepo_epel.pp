class rhel_mrepo_profile::repo_mirror::epel {

  require rhel_mrepo_profile

  $mirror_root      = $rhel_mrepo_profile::mirror_root

  $epel_mirror      = 'http://ftp.osuosl.org'

  $staging_target   = "${mirror_root}/iso"
  $epel_url         = "${epel_mirror}/pub/fedora-epel/\$release/\$arch/"

  ##############################################################################
  # EPEL 7
  ##############################################################################

  mrepo::repo { 'epel7-x86_64':
    ensure    => present,
    repotitle => 'EPEL $release ($arch) Latest',
    arch      => 'x86_64',
    release   => '7',
    hour      => '4',
    urls      => {
      epel => $epel_url,
    },
  }


  ##############################################################################
  # EPEL 6
  ##############################################################################

  mrepo::repo { 'epel6-x86_64':
    ensure    => present,
    repotitle => 'EPEL $release ($arch) Latest',
    arch      => 'x86_64',
    release   => '6',
    hour      => '4',
    urls      => {
      epel => $epel_url,
    },
  }

}
