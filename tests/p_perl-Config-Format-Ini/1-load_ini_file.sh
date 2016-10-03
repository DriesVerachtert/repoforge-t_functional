#!/bin/bash
# Author: Dries Verachtert <dries.verachtert@dries.eu>

t_Log "Running $0 - test with a small ini file"

PERLSCRIPT=`mktemp -q --suffix=.pl`
INIFILE=`mktemp -q --suffix=.ini`

cat > $INIFILE <<'EOF'
[os]
name = CentOS
version = 7
arch = x86_64
testkey = testvalue
EOF

cat > $PERLSCRIPT <<'EOF'
use Config::Format::Ini;
use File::Slurp qw(slurp);

#print ("ini file: " . $ARGV[0]);

my $iniContents = read_ini($ARGV[0]);
die "iniContents not defined" unless defined($iniContents);
die "os section not defined" unless defined($iniContents->{'os'});
die "testkey contains wrong value" unless ($iniContents->{'os'}->{'testkey'}[0] eq 'testvalue');
die "name contains wrong value" unless ($iniContents->{'os'}->{'name'}[0] eq 'CentOS');
print "Config::Format::Ini test OK";
EOF

perl -Wall $PERLSCRIPT $INIFILE | grep -q 'Config::Format::Ini test OK'
t_CheckExitStatus $?

rm -f $PERLSCRIPT $INIFILE
