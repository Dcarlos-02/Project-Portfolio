USE Tipa_electro_DB;
GO

BULK INSERT customer
FROM 'C:\Users\Carlos Dave Sidney\OneDrive\Desktop\Tipa electro solution\Customer.csv'
WITH (
		FIRSTROW= 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		KEEPNULLS,
		TABLOCK
);

BULK INSERT transactions
FROM 'C:\Users\Carlos Dave Sidney\OneDrive\Desktop\Tipa electro solution\transactions.csv'
WITH (
		FIRSTROW= 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		KEEPNULLS,
		TABLOCK
);

BULK INSERT transaction_detail
FROM 'C:\Users\Carlos Dave Sidney\OneDrive\Desktop\Tipa electro solution\TransactionDetail.csv'
WITH (
		FIRSTROW= 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		KEEPNULLS,
		TABLOCK
);

BULK INSERT products
FROM 'C:\Users\Carlos Dave Sidney\OneDrive\Desktop\Tipa electro solution\Product.csv'
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
