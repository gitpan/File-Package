#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE $FILE);
$VERSION = '0.11';   # automatically generated file
$DATE = '2004/04/10';
$FILE = __FILE__;


##### Test Script ####
#
# Name: Package.t
#
# UUT: File::Package
#
# The module Test::STDmaker generated this test script from the contents of
#
# t::File::Package;
#
# Don't edit this test script file, edit instead
#
# t::File::Package;
#
#	ANY CHANGES MADE HERE TO THIS SCRIPT FILE WILL BE LOST
#
#       the next time Test::STDmaker generates this script file.
#
#

######
#
# T:
#
# use a BEGIN block so we print our plan before Module Under Test is loaded
#
BEGIN { 

   use FindBin;
   use File::Spec;
   use Cwd;

   ########
   # The working directory for this script file is the directory where
   # the test script resides. Thus, any relative files written or read
   # by this test script are located relative to this test script.
   #
   use vars qw( $__restore_dir__ );
   $__restore_dir__ = cwd();
   my ($vol, $dirs) = File::Spec->splitpath($FindBin::Bin,'nofile');
   chdir $vol if $vol;
   chdir $dirs if $dirs;

   #######
   # Pick up any testing program modules off this test script.
   #
   # When testing on a target site before installation, place any test
   # program modules that should not be installed in the same directory
   # as this test script. Likewise, when testing on a host with a @INC
   # restricted to just raw Perl distribution, place any test program
   # modules in the same directory as this test script.
   #
   use lib $FindBin::Bin;

   ########
   # Using Test::Tech, a very light layer over the module "Test" to
   # conduct the tests.  The big feature of the "Test::Tech: module
   # is that it takes expected and actual references and stringify
   # them by using "Data::Secs2" before passing them to the "&Test::ok"
   # Thus, almost any time of Perl data structures may be
   # compared by passing a reference to them to Test::Tech::ok
   #
   # Create the test plan by supplying the number of tests
   # and the todo tests
   #
   require Test::Tech;
   Test::Tech->import( qw(plan ok skip skip_tests tech_config finish) );
   plan(tests => 14);

}


END {
 
   #########
   # Restore working directory and @INC back to when enter script
   #
   @INC = @lib::ORIG_INC;
   chdir $__restore_dir__;
}

   # Perl code from C:
    use File::Package;
    my $uut = 'File::Package';

ok(  my $loaded = $uut->is_package_loaded('File::Package'), # actual results
      '1', # expected results
     "",
     "UUT loaded");

#  ok:  1

ok(  my $error = $uut->load_package( 'File::Basename' ), # actual results
     '', # expected results
     "",
     "Good Load");

#  ok:  2

   # Perl code from C:
$error = $uut->load_package( '_File_::BadLoad' );

ok(  $error =~ /^Cannot load _File_::BadLoad/ ? 1 : 0, # actual results
     1, # expected results
     "$error",
     "Bad Load");

#  ok:  3

   # Perl code from C:
$error = $uut->load_package( '_File_::BadPackage' );

ok(  $error =~ /_File_::BadPackage absent./ ? 1 : 0, # actual results
     1, # expected results
     "$error",
     "File Loads, Package absent");

#  ok:  4

ok(  $error = $uut->load_package( '_File_::Multi', 
        [qw(File::Package1  File::Package2 File::Package3)] ), # actual results
     '', # expected results
     "",
     "Multiple Package Load");

#  ok:  5

   # Perl code from C:
$error = $uut->load_package( '_File_::Hyphen-Test' );

ok(  $error ? 1 : 0, # actual results
     1, # expected results
     "$error",
     "File::Hyphen-Test Load");

#  ok:  6

ok(  !defined($main::{'find'}), # actual results
     1, # expected results
     "",
     "No &File::Find::find import baseline");

#  ok:  7

ok(  $error = $uut->load_package( 'File::Find', 'find', ['File::Find'] ), # actual results
     '', # expected results
     "",
     "Load File::Find, Import &File::Find::find");

#  ok:  8

ok(  defined($main::{'find'}), # actual results
     '1', # expected results
     "",
     "&File::Find::find imported");

#  ok:  9

ok(  !defined($main::{'finddepth'}), # actual results
     1, # expected results
     "",
     "&File::Find::finddepth not imported");

#  ok:  10

ok(  $error = 0 < length($uut->load_package( 'File::Find', 'Jolly_Green_Giant')), # actual results
     '1', # expected results
     "",
     "Import error");

#  ok:  11

ok(  !defined($main::{'finddepth'}), # actual results
     1, # expected results
     "",
     "&File::Find::finddepth still no imported");

#  ok:  12

ok(  $error = $uut->load_package( 'File::Find', ''), # actual results
     '', # expected results
     "",
     "Import all File::Find functions");

#  ok:  13

ok(  defined($main::{'finddepth'}), # actual results
     '1', # expected results
     "",
     "&File::Find::finddepth imported");

#  ok:  14


    finish();

__END__

=head1 NAME

Package.t - test script for File::Package

=head1 SYNOPSIS

 Package.t -log=I<string>

=head1 OPTIONS

All options may be abbreviated with enough leading characters
to distinguish it from the other options.

=over 4

=item C<-log>

Package.t uses this option to redirect the test results 
from the standard output to a log file.

=back

=head1 COPYRIGHT

copyright � 2003 Software Diamonds.

Software Diamonds permits the redistribution
and use in source and binary forms, with or
without modification, provided that the 
following conditions are met: 

/=over 4

/=item 1

Redistributions of source code, modified or unmodified
must retain the above copyright notice, this list of
conditions and the following disclaimer. 

/=item 2

Redistributions in binary form must 
reproduce the above copyright notice,
this list of conditions and the following 
disclaimer in the documentation and/or
other materials provided with the
distribution.

/=back

SOFTWARE DIAMONDS, http://www.SoftwareDiamonds.com,
PROVIDES THIS SOFTWARE 
'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL SOFTWARE DIAMONDS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL,EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE,DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING USE OF THIS SOFTWARE, EVEN IF
ADVISED OF NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE POSSIBILITY OF SUCH DAMAGE.

=cut

## end of test script file ##

