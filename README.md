## Archived
> This project was archived on the 9th of June 2021.\ 
This addon is considered to be in a working state and does not require and 
further changes.\
If you use this addon and discover that it is not working,
please leave a comment on either my 
[Steam profile](https://steamcommunity.com/id/redfox32dotxyz) or on
[Twitter](https://twitter.com/RedFox0x20) 
and I will immediately review the error and publish changes to the repo.

# GMOD TTT Default map
A simple script to set a default map when all players are spectators or the
server is empty. The check only happens when a player disconnects keeping this
script light weight and using minimal server resources.


## Setting the map
The map can be set within `sv_defaultmap.lua` using the `rf_ttt_defaultmap.map"
value. Ensure that the string provided matches the name of the map file in the
`garrysmod/maps` directory, if it does not exist errors may occour.

## Timer
The timer feature delays the switch to the new map, the `rf_ttt_defaultmap.empty_time` value
determines how long in seconds we should wait, by default this is `300 seconds
(5 minutes)`. 

The timer can be enabled or disabled by changing the
`rf_ttt_defaultmap.use_timer` by changing the value to `true` or `false`
respectively.

When the timer is active, if a player joins before the timer
finishes the switch to a new map is cancelled.


When the timer is disabled the map switch will happen immediate if all players
are spectators or all players have disconnected.
