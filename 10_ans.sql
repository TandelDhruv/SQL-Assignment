
-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person). 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
    Select name,address
    from people join address
		on people.id = address.id
	group by name;

-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
    Select name,address
    from people join address
		on people.id = address.id
	where updatedate in (select max(updatedate) from address group by id)
    group by name;
    
