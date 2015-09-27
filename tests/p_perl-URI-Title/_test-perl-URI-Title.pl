# Author: Dries Verachtert <dries.verachtert@dries.eu>

use strict;
use warnings;

use URI::Title qw( title );
my $title = title('http://www.theregister.co.uk/');

if ($title =~ /^The Register: Sci\/Tech News for the World/) {
         # OK!
         exit 0
} else {
         # :-(
         print "wrong or empty title: $title\n";
         exit 1
}
                  