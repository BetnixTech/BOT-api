
const commands = require('./commands');
function start(){
    console.log('JS Game Simulation Started');
    const player = 'Charlie';
    console.log(commands.handle('attack', player));
}
module.exports={start};
