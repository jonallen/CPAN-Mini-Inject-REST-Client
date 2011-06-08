use inc::Module::Install;

name     'CPAN-Mini-Inject-REST-Client';
all_from 'lib/CPAN/Mini/Inject/REST/Client.pm';
author   q{Jon Allen (JJ) <jj@jonalen.info>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

