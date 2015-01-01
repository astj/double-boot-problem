use Plack::Builder;
use DBI;

my $app = sub {
    my $env = shift;

    my $hoge;
    while (1) { $hoge = rand; }

    return [200,  [ 'Content-Type' => 'text/html' ], []];
};

builder {
    enable 'AxsLog',
        ltsv => 1,
        response_time => 1,
        logger => sub {
            print($@);
        };
    $app;
};
