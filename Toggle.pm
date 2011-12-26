use warnings;
use strict;

use BarnOwl;

package BarnOwl::Module::Toggle;

sub toggle {
    my $cmdname = shift;
    my $varname = shift;
    my $var = BarnOwl::getvar($varname);
    if (!$var) {
        BarnOwl::error("$varname not found");
        return;
    }
    if ($var eq 'on') {
        BarnOwl::set($varname, 'off');
    } elsif ($var eq 'off') {
        BarnOwl::set($varname, 'on');
    }
}

BarnOwl::new_command
	(toggle => \&toggle,
	 {summary => "toggle variable value (on <-> off) if applicable",}
	);

1;
