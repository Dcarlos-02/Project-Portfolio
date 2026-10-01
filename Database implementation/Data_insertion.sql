USE Tipa_electro_DB;
GO

BULK INSERT customer   
FROM '<path_to_data>\Customer.csv'    	--Removed actual path for security and privacy purposes
WITH (
		FIRSTROW= 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		KEEPNULLS,
		TABLOCK
);

BULK INSERT transactions
FROM '<path_to_data>\transactions.csv'			--Removed actual path for security and privacy purposes
WITH (
		FIRSTROW= 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		KEEPNULLS,
		TABLOCK
);

BULK INSERT transaction_detail
FROM '<path_to_data>\TransactionDetail.csv'			--Removed actual path for security and privacy purposes
WITH (
		FIRSTROW= 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		KEEPNULLS,
		TABLOCK
);

BULK INSERT products
FROM '<path_to_data>\Product.csv'			--Removed actual path for security and privacy purposes
WITH (
		FORMAT = 'CSV',
		FIELDQUOTE = '"',
		FIRSTROW= 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		CODEPAGE = '65001',
		KEEPNULLS,
		TABLOCK
);

INSERT INTO dbo.membership
VALUES (1, 'None', 'No membership', 0, 0, 12 ),
	    (5,'Platinum', 'Top-tier membership', 129.99, 15, 24 );
