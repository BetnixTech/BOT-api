package Commands;
use strict;
use warnings;
my %commands = ();
sub register_command { my ($name,$code)=@_; $commands{$name}=$code; }
sub execute_command { my ($player,$cmd,@args)=@_; return exists $commands{$cmd} ? $commands{$cmd}->($player,@args) : "Unknown command: $cmd"; }
1;
