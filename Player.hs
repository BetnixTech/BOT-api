module Player where
import Data.List (delete)

data Player = Player {
    name :: String,
    level :: Int,
    experience :: Int,
    inventory :: [String]
} deriving Show

initPlayer :: String -> Player
initPlayer n = Player n 1 0 []

addItem :: Player -> String -> Player
addItem p item = p { inventory = item : inventory p }

removeItem :: Player -> String -> Player
removeItem p item = p { inventory = delete item (inventory p) }

gainExp :: Player -> Int -> Player
gainExp p points =
    let newExp = experience p + points
        newLevel = if newExp >= 100 then level p + 1 else level p
        finalExp = if newExp >= 100 then newExp - 100 else newExp
    in p { level = newLevel, experience = finalExp }
