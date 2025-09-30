package Events;
use strict;
use warnings;
my %events=();
sub on { my ($event,$code)=@_; push @{$events{$event}},$code; }
sub trigger { my ($event,@args)=@_; $_->(@args) for @{$events{$event}} if exists $events{$event}; }
1;
