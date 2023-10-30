
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
    select name from package join client
    on package.recipient = client.AccountNumber
    where weight = 1.5;
    
-- 7.2 What is the total weight of all the packages that he sent?
	select Sum(weight) as Total_Weight from package join client
    on package.recipient = client.AccountNumber
    where client.name = "Al Gore's Head" ;