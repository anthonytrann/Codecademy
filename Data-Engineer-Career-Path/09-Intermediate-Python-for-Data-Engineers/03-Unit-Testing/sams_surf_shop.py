# Write your code below:
import surfshop
import unittest 

class SurfShopTest(unittest.TestCase):
  def setUp(self):
    self.cart = surfshop.ShoppingCart()

  def test_add_surfboards_1(self):
    self.assertEqual(self.cart.add_surfboards(1), 'Successfully added 1 surfboard to cart!')

  def test_add_surfboards_multi(self):
    for i in range(2,3):
      with self.subTest(i):    
        self.assertEqual(self.cart.add_surfboards(i), f'Successfully added {i} surfboards to cart!')
  
  # @unittest.skip
  def test_add_surfboards_error(self):
    self.assertRaises(surfshop.TooManyBoardsError, self.cart.add_surfboards, 5)

  # @unittest.expectedFailure
  def test_locals_discount(self):
    self.cart.apply_locals_discount()
    self.assertTrue(self.cart.locals_discount)



unittest.main()


