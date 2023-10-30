
-- 5.1 Select the name of all the pieces. 
	select name from pieces;
    
-- 5.2  Select all the providers' data. 
	select * from providers;
    
-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
	select code,avg(price) as Avg_Price
    from provides left join pieces
		on provides.piece = pieces.code
	group by code;
        
-- 5.4  Obtain the names of all providers who supply piece 1.
	select providers.name as Providers 
    from providers left join provides
		on providers.code = provides.provider
	where piece = 1;
    
-- 5.5 Select the name of pieces provided by provider with code "HAL".
	select pieces.name from pieces left join provides
		on pieces.code = provides.Piece
    join providers on providers.code = provides.provider
    where providers.code = "HAL";
    
-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------
	select pieces.name as Piece_Name,
           providers.name as Provider_Name,
           max(Price) as Max_price
	from pieces join provides
		on pieces.code = provides.Piece
    join providers on providers.code = provides.provider
    group by Pieces.name;
    
-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
	INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'TNBC',7);
    
-- 5.8 Increase all prices by one cent.
	Select Piece,(price+1) as Latest_Price from provides;
    
-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
	Delete from provides where provider = "RBT" and piece = 4;
    
-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
	Delete from provides where provider = "RBT";
	