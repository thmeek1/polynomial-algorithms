-----------------------------------------------------------------------------------------
-- |
-- Authors : Tommy Meek and Frank Moore
--
-- Driver for polynomial operations and algorithms.
-----------------------------------------------------------------------------------------
import Data.Maybe (fromMaybe)
import qualified Data.Map as Map
import Data.Char.SScript (formatSS)
import qualified RingParams as RP
import qualified Polynomial as P
import Algorithms ((//), (/%), gb, isBasisOf, isGB)
import PolyParsers (Readable(..))

type R = P.Polynomial RP.Q 3 RP.GLex

main :: IO ()
main = do
    let
    let f1string = "x_1^5 + x_2^4 + x_3^3 - 1"
        f2string = "x_1^3 + x_2^3 + x_3^2 - 1"
        f1 = (fromString f1string) :: R
        f2 = (fromString f2string) :: R
        gbf = gb [f1,f2]
    putStrLn $ "f1 + f2 = " ++ (formatSS . show $ f1 + f2)
    putStrLn $ "f1 * f2 = " ++ (formatSS . show $ f1 * f2)
    putStrLn $ "S-poly of f1,f2 = " ++ (formatSS . show $ P.sPoly f1  f2)
--    print $ P.sPoly f1  f2
--    print $ gbf `isBasisOf` [f1,f2]
--    print $ isGB gbf
--    print $ map P.numTerms gbf
--    print $ map P.totalDegree gbf
--    putStrLn $ "GB <f1,f2> = " ++ (formatSS . show) gbf
