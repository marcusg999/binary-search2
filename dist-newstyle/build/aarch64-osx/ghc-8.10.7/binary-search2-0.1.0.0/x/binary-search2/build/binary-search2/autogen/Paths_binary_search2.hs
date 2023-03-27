{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_binary_search2 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/marcusgray/.cabal/bin"
libdir     = "/Users/marcusgray/.cabal/lib/aarch64-osx-ghc-8.10.7/binary-search2-0.1.0.0-inplace-binary-search2"
dynlibdir  = "/Users/marcusgray/.cabal/lib/aarch64-osx-ghc-8.10.7"
datadir    = "/Users/marcusgray/.cabal/share/aarch64-osx-ghc-8.10.7/binary-search2-0.1.0.0"
libexecdir = "/Users/marcusgray/.cabal/libexec/aarch64-osx-ghc-8.10.7/binary-search2-0.1.0.0"
sysconfdir = "/Users/marcusgray/.cabal/etc"

getBinDir     = catchIO (getEnv "binary_search2_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "binary_search2_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "binary_search2_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "binary_search2_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "binary_search2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "binary_search2_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
