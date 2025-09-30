module Commands where
import Player

type Command = Player -> [String] -> String

executeCommand :: [(String, Command)] -> String -> Player -> [String] -> String
executeCommand cmds name player args =
    case lookup name cmds of
        Just f -> f player args
        Nothing -> "Unknown command: " ++ name
""",
    "Haskell/AI.hs": """module AI where
import System.Random

aiResponse :: String -> IO String
aiResponse _ = do
    let responses = ["Attack now!", "Defend!", "Collect item!", "Hello adventurer!", "Level up!"]
    i <- randomRIO (0, length responses - 1)
    return (responses !! i)
