
const handlers = {};
module.exports = {
    on: (event, func) => { if(!handlers[event]) handlers[event]=[]; handlers[event].push(func); },
    trigger: (event, ...args) => { if(handlers[event]) handlers[event].forEach(f=>f(...args)); }
};
