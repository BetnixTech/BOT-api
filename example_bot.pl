#!/usr/bin/perl
use strict;
use warnings;
use lib '.';
use BotDev;
use Events;
use Logger;

BotDev::setup_example();

Events::on('item_collected', sub {
    my ($player,$item)=@_;
    Logger::log("$player just got a $item!");
});

BotDev::dev_loop();
