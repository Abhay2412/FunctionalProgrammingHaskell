import GHC.TypeLits (Nat)
-- Exercise 1-Define Multiplication recursively using Add 
mult :: Nat -> Nat -> Nat
mult Zero m = Zero
mult (Succ n) m = add (mult n m) m