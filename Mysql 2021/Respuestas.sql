/*1-----------------------------*/
SELECT p.ProductName , s.ContactName , s.Phone from Products p 
JOIN Suppliers s on p.SupplierID = s.SupplierID 
WHERE p.UnitsInStock < 10
AND s.Phone is not null;
/*2-----------------------------*/
SELECT p.ProductName, o.OrderDate, o.ShipCountry  from Orders o join `Order Details` od on o.OrderID = od.OrderID 
join Products p on od.ProductID = p.ProductID
WHERE year(o.OrderDate)=1998;
/*3-----------------------------*/
SELECT t.TerritoryDescription FROM Employees e
JOIN EmployeeTerritories et on e.EmployeeID = et.EmployeeID 
JOIN Territories t on et.TerritoryID = t.TerritoryID 
WHERE e.FirstName = 'Nancy' and e.LastName = 'Davolio'; 
/*4-----------------------------*/
SELECT CONCAT(e.FirstName , ' ' , e.LastName)  
from Customers c 
join Orders o on c.CustomerID = o.CustomerID
join Employees e on e.EmployeeID = o.EmployeeID 
where c.CompanyName = 'Bottom-Dollar Markets'
and MONTH(o.ShippedDate) = 04
and YEAR(o.ShippedDate) = 1997;

