package Player;
use strict;
use warnings;
my %players = ();
my @items = qw(Sword Shield Potion Gem Map Key Armor);

sub add_player {
    my ($name) = @_;
    $players{$name} = { level => 1, inventory => [] } unless exists $players{$name};
}

sub remove_player { my ($name)=@_; delete $players{$name}; }
sub player_exists { my ($name)=@_; return exists $players{$name}; }
sub add_item_to_player { my ($player,$item)=@_; push @{$players{$player}->{inventory}},$item if exists $players{$player}; }
sub remove_item_from_player { my ($player,$item)=@_; return unless exists $players{$player}; @{$players{$player}->{inventory}}=grep {$_ ne $item} @{$players{$player}->{inventory}}; }
sub list_inventory { my ($player)=@_; return unless exists $players{$player}; return @{$players{$player}->{inventory}}; }
sub random_item { return $items[int(rand(@items))]; }
1;
