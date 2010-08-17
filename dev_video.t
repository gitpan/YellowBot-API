use Test::More;

my $api_key    = $ENV{API_KEY};
my $api_secret = $ENV{API_SECRET};

plan skip_all => "API_KEY and API_SECRET environment variables must be set"
    unless $api_key and $api_secret;

plan tests => 3;

use_ok( 'YellowBot::API' );

ok(my $api = YellowBot::API->new
   (api_key    => $api_key,
    api_secret => $api_secret,
   ), 'new');

$api->server($ENV{API_SERVER} || 'http://www.yellowbot.com/');

ok(my $data = $api->call('location/details',
       api_version=>1,
       id => '/restaurant-le-fil-dariane-joliette-qc.html',
       get_videos => 1,
), 'fetch video data');

use Data::Dumper qw(Dumper);
print Dumper($data);
