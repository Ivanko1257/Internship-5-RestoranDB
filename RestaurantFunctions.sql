SELECT Food.NameOfFood AS NameOfFood, Menu.Price AS PriceOfFood FROM Food JOIN Menu ON Menu.FoodId = Food.FoodId
	WHERE Menu.Price < 15
SELECT OrderFood AS AnOrder, SUM(Menu.Price) AS Price FROM OrderFood JOIN Menu ON OrderFood.OrderId = Menu.OrderId
	WHERE EXTRACT(YEAR FROM OrderFood.TimeOfDelivery) > 50
	GROUP BY OrderFood
	HAVING SUM(Menu.Price) > 50
SELECT Employes.NameOfEmploye AS NameOfEmploye, COUNT(OrderFood) AS NumberOfOrders FROM Employes JOIN OrderFood ON Employes.EmployeId = OrderFood.DeliveryGuyId
	WHERE Employes.EmployeDuty = 'Delivery'
	GROUP BY Employes.NameOfEmploye
	HAVING COUNT(OrderFood) > 100
SELECT Employes.NameOfEmploye AS NameOfEmploye, Restaurant.NameOfRestaurant AS NameOfRestaurant FROM Employes JOIN Restaurant ON Employes.RestaurantId = Restaurant.RestaurantId
	WHERE Employes.EmployeDuty = 'Kitchen' AND Restaurant.CityOfRestaurant = 'Zagreb'
SELECT Restaurant.NameOfRestaurant AS NameOfRestaurant, COUNT(OrderFood.RestaurantId) AS NumberOdDeliveries FROM Restaurant JOIN OrderFood ON OrderFood.RestaurantId = Restaurant.RestaurantId
	WHERE Restaurant.CityOfRestaurant = 'Split' AND EXTRACT(YEAR FROM OrderFood.TimeOfDelivery) = 2023
	GROUP BY Restaurant.NameOfRestaurant
SELECT Food.NameOfFood AS NameOfFood, COUNT(OrderFood.FoodId) AS NumberOfOrders FROM Food JOIN OrderFood ON Food.FoodId = OrderFood.FoodId
	WHERE Food.Category = 'Desert' AND EXTRACT(YEAR FROM OrderFood.TimeOfDelivery) = 2023
	GROUP BY Food.NameOfFood
	HAVING COUNT(OrderFood.FoodId) > 10
SELECT Customers.NameOfCustomer AS CustomerName, Customers.SurnameOfCustomer AS CustomareSurname, COUNT(OrderFood) AS NumberOfOrders FROM Customers JOIN OrderFood ON OrderFood.CustomerId = Customers.CustomerId
	WHERE LEFT(Customers.SurnameOfCustomer,1) = 'M'
	GROUP BY Customers.NameOfCustomer, Customers.SurnameOfCustomer
SELECT Restaurant.NameOfRestaurant As RestaurantName FROM Restaurant
	WHERE Restaurant.RestaurantCapacity > 30 AND Restaurant.IsDeliveryAvalable = TRUE