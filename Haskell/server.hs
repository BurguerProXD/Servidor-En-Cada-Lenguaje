-- Haskell puro sin el paquete `network` no puede crear sockets.
main :: IO ()
main = putStrLn "Haskell server: requiere el paquete network (no incluido)."
