#!perl
#
#
use 5.001;
use strict;
use warnings;
use warnings::register;

use vars qw($VERSION $DATE);
$VERSION = '0.01';   # automatically generated file
$DATE = '2003/09/20';


##### Demonstration Script ####
#
# Name: Package.d
#
# UUT: File::Package
#
# The module Test::STDmaker generated this demo script from the contents of
#
# t::File::Package 
#
# Don't edit this test script file, edit instead
#
# t::File::Package
#
#	ANY CHANGES MADE HERE TO THIS SCRIPT FILE WILL BE LOST
#
#       the next time Test::STDmaker generates this script file.
#
#

######
#
# The working directory is the directory of the generated file
#
use vars qw($__restore_dir__ @__restore_inc__ );

BEGIN {
    use Cwd;
    use File::Spec;
    use File::TestPath;
    use Test::Tech qw(tech_config plan demo skip_tests);

    ########
    # Working directory is that of the script file
    #
    $__restore_dir__ = cwd();
    my ($vol, $dirs, undef) = File::Spec->splitpath(__FILE__);
    chdir $vol if $vol;
    chdir $dirs if $dirs;

    #######
    # Add the library of the unit under test (UUT) to @INC
    #
    @__restore_inc__ = File::TestPath->test_lib2inc();

    unshift @INC, File::Spec->catdir( cwd(), 'lib' ); 

}

END {

   #########
   # Restore working directory and @INC back to when enter script
   #
   @INC = @__restore_inc__;
   chdir $__restore_dir__;

}

print << 'MSG';

 ~~~~~~ Demonstration overview ~~~~~
 
Perl code begins with the prompt

 =>

The selected results from executing the Perl Code 
follow on the next lines. For example,

 => 2 + 2
 4

 ~~~~~~ The demonstration follows ~~~~~

MSG

demo( "\ \ \ \ use\ File\:\:Spec\;\
\
\ \ \ \ use\ File\:\:Package\;\
\ \ \ \ my\ \$uut\ \=\ \'File\:\:Package\'\;\
\ \ \ \ use\ File\:\:Package\;"); # typed in command           
          use File::Spec;

    use File::Package;
    my $uut = 'File::Package';
    use File::Package;; # execution

demo( "my\ \$errors\ \=\ \$uut\-\>load_package\(\ \'File\:\:Basename\'\ \)", # typed in command           
      my $errors = $uut->load_package( 'File::Basename' )); # execution


demo( "\'\'\ ne\ \(\$errors\ \=\ \$uut\-\>load_package\(\ \'t\:\:File\:\:BadLoad\'\ \)\ \)", # typed in command           
      '' ne ($errors = $uut->load_package( 't::File::BadLoad' ) )); # execution


demo( "\'\'\ ne\ \(\$errors\ \=\ \$uut\-\>load_package\(\ \'t\:\:File\:\:BadVocab\'\ \)\ \)", # typed in command           
      '' ne ($errors = $uut->load_package( 't::File::BadVocab' ) )); # execution


demo( "\!defined\(\$main\:\:\{\'find\'\}\)", # typed in command           
      !defined($main::{'find'})); # execution


demo( "\$errors\ \=\ \$uut\-\>load_package\(\ \'File\:\:Find\'\,\ \'find\'\ \)", # typed in command           
      $errors = $uut->load_package( 'File::Find', 'find' )); # execution


demo( "defined\(\$main\:\:\{\'find\'\}\)", # typed in command           
      defined($main::{'find'})); # execution


demo( "\!defined\(\$main\:\:\{\'finddepth\'\}\)", # typed in command           
      !defined($main::{'finddepth'})); # execution


demo( "\$errors\ \=\ \$uut\-\>load_package\(\ \'File\:\:Find\'\,\ \'\'\)", # typed in command           
      $errors = $uut->load_package( 'File::Find', '')); # execution


demo( "\!defined\(\$main\:\:\{\'finddepth\'\}\)", # typed in command           
      !defined($main::{'finddepth'})); # execution


demo( "\$errors\ \=\ \$uut\-\>load_package\(\ \'File\:\:Find\'\)", # typed in command           
      $errors = $uut->load_package( 'File::Find')); # execution


demo( "defined\(\$main\:\:\{\'finddepth\'\}\)", # typed in command           
      defined($main::{'finddepth'})); # execution



=head1 NAME

Package.d - demostration script for File::Package

=head1 SYNOPSIS

 Package.d

=head1 OPTIONS

None.

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

## end of test script file ##

=cut

