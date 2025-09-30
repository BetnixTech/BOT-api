package AI;
use strict;
use warnings;
sub ai_response { my ($prompt)=@_; my @responses=("Attack now!","Defend your base!","Collect the item!","Hello adventurer!","You found a rare item!","Level up!"); return $responses[int(rand(@responses))]; }
1;
