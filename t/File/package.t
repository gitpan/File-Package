#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE);
$VERSION = '0.09';
$DATE = '2003/09/13';

use File::Spec;
use File::Package;
use Test;
use Cwd;

######
#
# T:
#
# use a BEGIN block so we print our plan before Module Under Test is loaded
#
BEGIN { 
   use vars qw( $__tests__ @__restore_inc__ $__restore_dir__);

   ########
   # Create the test plan by supplying the number of tests
   # and the todo tests
   #
   $__tests__ = 8;
   plan(tests => $__tests__);

   ########
   # Working directory is that of the script file
   #
   $__restore_dir__ = cwd();
   my ($vol, $dirs, undef) = File::Spec->splitpath( __FILE__ );
   chdir $vol if $vol;
   chdir $dirs if $dirs;

   @__restore_inc__ = @INC;
   chdir File::Spec->updir();
   chdir File::Spec->updir();
   unshift @INC, cwd();

}


END {

    #########
    # Restore working directory  to when enter script
    #
    chdir $__restore_dir__;
    @INC = @__restore_inc__
}


#####
# New $fu object
#
my $fu = 'File::Package';

#######
#
# ok: 1 
#
# R:
#
my $loaded;
print "# is_package_loaded\n";
ok ($loaded = $fu->is_package_loaded('File::Basename'), ''); 

#######
# 
# ok:  2
#
# R:
# 
print "# load_package\n";
my $errors = $fu->load_package( 'File::Basename' );
skip($loaded, $errors, '');

#######
# 
# ok:  3
#
# R:
# 
print "# bad load\n";
$errors = $fu->load_package( 't::File::BadLoad' );
ok($errors ne '', 1, $errors);


#######
# 
# ok:  4
#
# R:
# 
print "# bad vocab\n";
$errors = $fu->load_package( 't::File::BadVocab' );
ok($errors ne '', 1, $errors);


#######
#
# ok: 5 
#
# R:
#
print "# import function\n";
ok( !defined(&{$File::Package::{'find'}}), 1);


#######
#
# ok: 6
#
# R:
#
print "# import function\n";
$fu->load_package('File::Find', 'find'); 
ok( defined(&{$File::Package::{'find'}}), 1);


#######
#
# ok: 7 
#
# R:
#
print "# import function\n";
ok( !defined(&{$File::Package::{'finddepth'}}), 1);


#######
#
# ok: 8
#
# R:
#
print "# import all functions\n";
$fu->load_package('File::Find', ''); 
ok( defined(&{$File::Package::{'finddepth'}}), 1);


__END__


=head1 NAME

package.t - test script for $fu

=head1 SYNOPSIS

 package.t 

=head1 COPYRIGHT

copyright © 2003 Software Diamonds.

Software Diamonds permits the redistribution
and use in source and binary forms, with or
without modification, provided that the 
following conditions are met: 

=over 4

=item 1

Redistributions of source code, modified or unmodified
must retain the above copyright notice, this list of
conditions and the following disclaimer. 

=item 2

Redistributions in binary form must 
reproduce the above copyright notice,
this list of conditions and the following 
disclaimer in the documentation and/or
other materials provided with the
distribution.

=back

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

