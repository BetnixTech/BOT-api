package BotDev;
use strict;
use warnings;
use Player;
use Commands;
use Events;
use AI;
use Logger;
use Tasks;

sub setup_example {
    Commands::register_command('attack', sub { my ($player,@_) = @_; return "$player attacks!"; });
    Commands::register_command('defend', sub { my ($player,@_) = @_; return "$player defends!"; });
    Commands::register_command('collect', sub {
        my ($player,@_) = @_;
        my $item = Player::random_item();
        Player::add_item_to_player($player,$item);
        Events::trigger('item_collected',$player,$item);
        return "$player collected $item!";
    });
    Commands::register_command('chat', sub {
        my ($player,@msg) = @_;
        return "$player says: ".AI::ai_response(join(' ',@msg));
    });
}

sub dev_loop {
    print "PerlBotSDK Developer Loop Started. Type 'exit' to quit.\n";
    while (1) {
        print "Enter command (<player> <command> [args]): ";
        chomp(my $input = <STDIN>);
        last if $input eq 'exit';
        my ($player, $cmd, @args) = split /\s+/, $input;
        Player::add_player($player) unless Player::player_exists($player);
        my $resp = Commands::execute_command($player, $cmd, @args);
        print "$resp\n";
        Tasks::run_tasks();
    }
}

1;
