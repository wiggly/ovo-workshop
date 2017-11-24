module Data (
  mkList
  , prependList
  , headList
  , tailList
  , stringList
  , mapList
  )
       where

data List a = Cell a (List a)
            | Nil
            deriving (Eq,Show)

-- | Make a single entry list from a value
mkList :: a -> List a
mkList x = Cell x Nil

-- | Prepend the given value to the head of the list
prependList :: a -> List a -> List a
prependList x lst = Cell x lst

-- | Return the value at the head of the list
headList :: List a -> a
headList (Cell x _) = x

-- | Return he value at the tail of the list
tailList :: List a -> List a
tailList (Cell _ rest) = rest

-- | Convert our list to a string neatly
stringList :: Show a => List a -> String
stringList Nil = ""
stringList (Cell x lst) = (show x) ++ " : " ++ (stringList lst)

-- | Apply some function to all items in a list
mapList :: (a -> b) -> List a -> List b
mapList _ Nil = Nil
mapList fn (Cell x lst) = Cell (fn x) (mapList fn lst)

instance Functor List where
  fmap fn lst = mapList fn lst
