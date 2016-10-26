SELECT Sum1.LastName, Sum1.FirstName, Sum1.OrderDate, Sum2.ProductName, Sum2.ItemPrice, Sum2.DiscountAmount, Sum2.Quantity
FROM
		(SELECT Customers.LastName, Customers.FirstName, Orders.OrderDate, Orders.OrderID
		FROM Customers JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
		) AS Sum1

	JOIN
		(SELECT Products.ProductName, OrderItems.ItemPrice, OrderItems.DiscountAmount, OrderItems.Quantity, OrderItems.OrderID
		 FROM Products JOIN OrderItems
		 ON Products.ProductID = OrderItems.ProductID
		
		) AS Sum2
	ON  Sum1.OrderID = Sum2.OrderID
ORDER BY Sum1.LastName, Sum1.OrderDate, Sum2.ProductName; 

