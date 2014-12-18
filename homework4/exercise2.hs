data Tree a = Leaf | Node Integer (Tree a) a (Tree a) deriving (Show, Eq)
foldTree :: [a] -> Tree a
foldTree = foldr go Leaf


{- foldr :: (a -> b -> b) -> b -> [a] -> b -}

go :: a -> Tree a -> Tree a
go x Leaf = Node 0 Leaf x Leaf
go x Node h ln@(Node _ _ _ _) v Leaf              = Node h ln                   v (Node 0 Leaf x Leaf)
go x Node h Leaf              v rn@(Node _ _ _ _) = Node h (Node 0 Leaf x Leaf) v rn 
go x (Node h n1 v n2) = 
    | getHeight n1 > getHeight n2 = 

