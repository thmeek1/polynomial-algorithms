Haskell












fn :: X -> Y
fn x = y









-- Add two numbers in C
int add(int x, int y) {
    return x + y;
}









-- Add two numbers in Haskell
add :: (Int,Int) -> Int
add (x,y) = x + y


-- Add two numbers with Currying
add :: Int -> Int -> Int
add x y = x + y








-- Square a list
squareIt :: [Int] -> [Int]
squareIt xs = map (^2) xs





-- Get the 3rd through 7th squares
take 5 (squareIt [3..])

-- Result: [9, 16, 25, 36, 49]






-- Test Collatz conjecture in C
int collatz(int n) {
    while (n != 1) {
        if (n % 2 == 0) {
            n = n / 2;
        } else {
            n = 3 * n + 1;
        }
    }
    return n;
}








-- Test Collatz conjecture in Haskell
collatz :: Int -> Int
collatz n
    | n == 1    = 1
    | isEven n  = collatz (n `div` 2)
    | otherwise = collatz (3 * n + 1)







-- Defining a type with
-- three value constructors
data Color = Red | Blue | Green







-- The definition of the Maybe type
Maybe a = Nothing | Just a









-- Instance Show on the Color type
instance Show Color where
    show Red   = "Red"
    show Blue  = "Blue"
    show Green = "Green"









-- Vector using type level naturals
Vector :: Nat -> * where
    MakeVector :: [Int] -> Vector n






-- Maybe in GADTs syntax
Maybe :: * -> * where
    Nothing :: Maybe a
    Just :: a -> Maybe a








fmap :: (a -> b) -> f a -> f b





fmap :: (a -> b) -> (f a -> f b)














instance Functor Maybe where
    fmap f Nothing  = Nothing
    fmap f (Just a) = Just (f a)










fmap id == id
fmap (f . g) == fmap f . fmap g













class Applicative m => Monad m where
    (>>=)   :: m a -> (a -> m b) -> m b
    (>>)    :: m a -> m b -> m b
    return  :: a -> m a
    m >> k  = m >>= \x -> k
    return  = pure










return x >>= f = f x
m >>= return = m
m >>= (\x -> f x >>= g) = (m >>= f) >>= g











instance Monad Maybe where
    (Just x) >>= f = f x
    Nothing  >>= f = Nothing










join :: (Monad m) => m (m a) -> m a
join x = x >>= id









x >>= f = join (fmap f x)








join . return = id
join . fmap return = id
join . fmap join = join . join
