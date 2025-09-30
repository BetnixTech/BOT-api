
module.exports = {
    attack: (player) => player + ' attacks!',
    defend: (player) => player + ' defends!',
    chat: (player, msg) => player + ' says: ' + msg,
    handle: function(cmd, player){
        const key = cmd.split(' ')[0];
        if(this[key]) return this[key](player);
        return 'Unknown command.';
    }
};
