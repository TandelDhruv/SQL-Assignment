
-- 1. Write a query to display employee numbers and employee name (first name, last name) of all the sales employees who received an amount of 2000 in bonus.
	select employeeID,concat(firstname," ",lastname) as emp_name from salesperson join employee
		on salesperson.salespersonID = employee.employeeID
    join contact on employee.contactID = contact.contactID
    where bonus = 2000;  
    
-- 2. Fetch address details of employees belonging to the state CA. If address is null, provide default value N/A.
	select employeeID,ifnull(addressline1,"N/A") as emp_address from employeeaddress join address
		on employeeaddress.AddressID = address.AddressID 
	join stateprovince on address.StateProvinceID = stateprovince.StateProvinceID
    where CountryRegionCode = "CA";
    
-- 3. Write a query that displays all the products along with the Sales OrderID even if an order has never been placed for that product.
	select product.productID,product.name,productnumber,salesorderid from product left join salesorderdetail
		on product.productID = salesorderdetail.productID;
        
-- 4. Find the subcategories that have at least two different prices less than $15.
	select productID as Subcategories from salesorderdetail where UnitPrice < 15 group by productID;
    
-- 5. A. Write a query to display employees and their manager details. Fetch employee id, employee first name, and manager id, manager name.
	select Sub.employeeID,sub.firstname as emp_firstname,sub.managerID,concat(sup.firstname," ",sup.lastname) as manager_name from emp_detail sup,emp_detail sub
    where sub.managerID = sup.employeeID;
    
--    B. Display the employee id and employee name of employees who do not have manager.
	select employeeID,concat(firstname," ",lastname) as emp_name from emp_detail where managerID is null;
    
-- 6. A. Display the names of all products of a particular subcategory 15 and the names of their vendors.
	select productsubcategory.name as product_name,vendor_detail.name as vendor_name from vendor_detail join productsubcategory
		on vendor_detail.productID = productsubcategory.ProductCategoryID
    where productsubcategoryID = 15;
    
--    B. Find the products that have more than one vendor.
	select product.ProductID,product.name from product join productvendor
     on product.ProductID = productvendor.ProductID
    group by product.productID
    having count(*) > 1;
    
-- 7. Find all the customers who do not belong to any store.
	select customer.CustomerID from customer left join store
	  on customer.CustomerID = store.CustomerID
	where store.name is null;
    
-- 8. Find sales prices of product 718 that are less than the list price recommended for that product.
	select unitprice as sales_price from salesorderdetail where productID = 718 group by sales_price;
    
-- 9. Display product number, description and sales of each product in the year 2001.
	select productid as product_number,count(orderqty) as sales from salesorderdetail
    join salesorderheader on salesorderdetail.SalesOrderID = salesorderheader.SalesOrderID
    where year(shipdate) = "2001"
    group by productId;
    
-- 10. Build the logic on the above question to extract sales for each category by year. Fetch Product Name, Sales_2001, Sales_2002, Sales_2003.
	select year(shipdate) as sales_year,productid,count(*) as sales from salesorderdetail
    join salesorderheader on salesorderdetail.SalesOrderID = salesorderheader.SalesOrderID
    group by sales_year;

/* Hint: For questions 9 & 10 (From Sales.SalesOrderHeader, sales. SalesOrderDetail,
Production. Product. Use ShipDate of SalesOrderHeader to extract shipped year.
Calculate sales using QTY and unitprice from Sales OrderDetail.)*/