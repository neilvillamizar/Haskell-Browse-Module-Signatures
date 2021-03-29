{-# LANGUAGE LambdaCase, ScopedTypeVariables, TypeApplications #-}
import Control.Exception (throwIO)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Writer (execWriterT, tell)
import Data.Foldable (for_)
import Data.Typeable (Typeable)
import qualified Language.Haskell.Interpreter as Hint


browse :: Hint.ModuleName -> IO [(String, String)]
browse moduleName = do
  result <- browse' moduleName
  case result of
    Right modInfo -> return modInfo
    Left interError -> return []

browse' moduleName = Hint.runInterpreter $ do
  Hint.loadModules [moduleName]
  Hint.setImports ["Prelude", "Data.Typeable", moduleName]
  exports <- Hint.getModuleExports moduleName
  execWriterT $ do
    for_ exports $ \case
      Hint.Fun identifier -> do
        tp <- lift $ Hint.typeOf identifier
        tell [(identifier, tp)]
      _ -> pure ()



main = do
  putStrLn "Enter the module name you want to browse:"
  moduleName <- getLine
  contents <- browse moduleName
  for_ contents $ \(identifier, tp) -> do
    putStrLn $ identifier ++ " :: " ++ tp
