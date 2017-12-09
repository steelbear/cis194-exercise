{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_week01 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\steelbear\\github\\cis194-exercise\\week01\\.stack-work\\install\\3573363d\\bin"
libdir     = "C:\\Users\\steelbear\\github\\cis194-exercise\\week01\\.stack-work\\install\\3573363d\\lib\\x86_64-windows-ghc-8.0.2\\week01-0.1.0.0-FAZKTd1s0voJQzFrO4HzEU"
dynlibdir  = "C:\\Users\\steelbear\\github\\cis194-exercise\\week01\\.stack-work\\install\\3573363d\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\steelbear\\github\\cis194-exercise\\week01\\.stack-work\\install\\3573363d\\share\\x86_64-windows-ghc-8.0.2\\week01-0.1.0.0"
libexecdir = "C:\\Users\\steelbear\\github\\cis194-exercise\\week01\\.stack-work\\install\\3573363d\\libexec"
sysconfdir = "C:\\Users\\steelbear\\github\\cis194-exercise\\week01\\.stack-work\\install\\3573363d\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "week01_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "week01_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "week01_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "week01_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "week01_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "week01_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
