package Tasks;
use strict;
use warnings;
my @tasks=();
sub schedule_task { my ($code)=@_; push @tasks,$code; }
sub run_tasks { $_->() for @tasks; @tasks=(); }
1;
