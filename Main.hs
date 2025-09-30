module Main where
import Player
import Commands
import AI
import Control.Monad

main :: IO ()
main = do
    let alice = initPlayer "Alice"
    let bob = initPlayer "Bob"

    let cmds = [("attack", \\p _ -> name p ++ " attacks!"),
                ("chat", \\p args -> name p ++ " says: Hello!")]

    putStrLn $ executeCommand cmds "attack" alice []
    putStrLn $ executeCommand cmds "chat" bob ["Hi"]
