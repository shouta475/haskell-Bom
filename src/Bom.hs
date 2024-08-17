module Bom (ex) where

import System.Random (randomRIO)

-- | The 'ex' function randomly selects between "ban", "bon", and "pon",
-- and then concatenates the selection a random number of times.
ex :: IO String
ex = do
    numTimes <- randomRIO (1, 10) :: IO Int -- Random number of times to repeat the string (1 to 10)
    result <- mapM (\_ -> randomSelect) [1..numTimes]
    return (concat result)

-- | 'randomSelect' randomly selects between "ban", "bon", and "pon".
randomSelect :: IO String
randomSelect = do
    index <- randomRIO (0, 2) ::IO Int  -- Randomly select an index from 0 to 2
    let options = ["ban", "bon", "pon"]
    return (options !! index)

-- Useage
-- main :: IO ()
-- main = do
--    result <- ex
--    putStrLn result
