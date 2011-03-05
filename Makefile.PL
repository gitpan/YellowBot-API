
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'The great new YellowBot::API!',
  'AUTHOR' => 'Ask Bjørn Hansen <ask@develooper.com>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'YellowBot-API',
  'EXE_FILES' => [
    'bin/ybapi'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'YellowBot::API',
  'PREREQ_PM' => {
    'Digest::SHA' => '0',
    'JSON' => '2.12',
    'LWP::UserAgent' => '0',
    'Moose' => '0',
    'URI' => '1.36',
    'namespace::clean' => '0'
  },
  'VERSION' => '0.93',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



