{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty

import Data.Monoid (mconcat)

import System.Environment

main = do
    port <- fmap read $ getEnv "PORT"
    scotty port $ do
        get "/:word" $ do
            beam <- param "word"
            html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]
        